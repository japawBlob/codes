package cz.cvut.fel.agents.pdv.student;

import cz.cvut.fel.agents.pdv.dsand.Message;
import cz.cvut.fel.agents.pdv.raft.RaftProcess;
import java.util.*;
import java.util.function.BiConsumer;

import static java.lang.Integer.max;
import static java.util.concurrent.ThreadLocalRandom.current;

/**
 * Vasim ukolem bude naimplementovat (pravdepodobne nejenom) tuto tridu. Procesy v clusteru pracuji
 * s logy, kde kazdy zanam ma podobu mapy - kazdy zaznam v logu by mel reprezentovat stav
 * distribuovane databaze v danem okamziku.
 *
 * Vasi implementaci budeme testovat v ruznych scenarich (viz evaluation.RaftRun a oficialni
 * zadani). Nasim cilem je, abyste zvladli implementovat jednoduchou distribuovanou key/value
 * databazi s garancemi podle RAFT.
 */

public class ClusterProcess extends RaftProcess<Map<String, String>> {

    // ostatni procesy v clusteru
    private final List<String> otherProcessesInCluster;
    // maximalni spozdeni v siti
    private final int networkDelays;

    private final States state;
    private int curr_epoque;
    private String parliament_votes;
    private Log log;
    private Integer tick;
    private Integer RunOut;
    private Integer permission;
    private String curr_leader;
    private final SortedSet<String> was_voted;
    private Random r;


    private Map<String, Integer> rem_proc_call;




    public ClusterProcess(String id, Queue<Message> inbox, BiConsumer<String, Message> outbox,
                          List<String> otherProcessesInCluster, int networkDelays) {
        super(id, inbox, outbox);
        this.networkDelays = max(1, networkDelays);
        this.otherProcessesInCluster = otherProcessesInCluster;

        this.log = new Log(curr_epoque);
        this.state = new States("follower");
        this.r =new Random();
        this.permission = new Integer(0);
        this.RunOut = new Integer(0);
        this.tick = new Integer(0);
        this.curr_leader = null;


        this.was_voted = new TreeSet<>();
        this.rem_proc_call = new HashMap<>();


    }

    @Override
    public Optional<Map<String, String>> getLastSnapshotOfLog() {
    // komentar viz deklarace
       return Optional.empty();
    }

    @Override
    public String getCurrentLeader() {
        return this.curr_leader;
    }

    private void resetRunOut() {
        RunOut = this.tick + current().nextInt(5 * this.networkDelays, 10 * this.networkDelays);
        System.out.println(RunOut);
    }
    
    @Override
    public void act() {
        this.tick++;
        //System.out.println(this.state.getState());
        if ((state.getState().equals("follower") || state.getState().equals("candidate")) && RunOut < tick) {
            this.curr_epoque++;
            this.state.setState("candidate");
            this.parliament_votes = getId();

            this.rem_proc_call = new HashMap<>();

          for (String neighbour : otherProcessesInCluster) {
            rem_proc_call.put(neighbour, 0);


          }
            resetRunOut();
        }
        //System.out.println(this.was_voted.size());
        if ((was_voted.size() + 1 > otherProcessesInCluster.size() / 2)&& state.getState().equals("candidate")){
            this.state.setState("leader");
            this.rem_proc_call = new HashMap<>();
            this.curr_leader = getId();


          for (String neighbour : otherProcessesInCluster) {

              this.rem_proc_call.put(neighbour, 999999999);

              }
            this.RunOut = 999999999;
          }


        for (String thrd : otherProcessesInCluster) {
            if (state.getState().equals("candidate") && rem_proc_call.get(thrd) <= tick) {
              rem_proc_call.put(thrd, 3 * networkDelays);
              RequestVote post = new RequestVote(this.curr_epoque, getId());
              send(thrd, post);
            }


            if (state.getState().equals("leader")){

                    AppendEntries post = new AppendEntries(this.curr_epoque, getId());
                    this.send(thrd, post);
                }
            }

        for (Message m : inbox) {

            if (m instanceof RequestVote) {
                System.out.println("this.currentEpoque " + this.curr_epoque +" message epoq "+ ((RequestVote) m).term);
                if (this.curr_epoque == ((RequestVote) m).term && (parliament_votes == null || parliament_votes == ((RequestVote) m).sender)) {

                    this.parliament_votes = ((RequestVote) m).sender;
                    resetRunOut();
                    permission = 1;
                }
                //System.out.println(permission);
                send(((RequestVote) m).candidateId, new RequestVoteResponse(this.curr_epoque, permission));
            }

            else if (m instanceof AppendEntries) {

                if (this.curr_epoque < (((AppendEntries) m)).term) {
                    this.curr_epoque = (((AppendEntries) m)).term;
                    this.state.setState("follower");
                    this.parliament_votes = null;
                    if (this.RunOut < tick || this.RunOut == 999999999) {
                        resetRunOut();
                    }
                }
                if (this.curr_epoque == (((AppendEntries) m)).term) {
                    this.state.setState("follower");
                    this.curr_leader = (((AppendEntries) m)).leaderId;
                    resetRunOut();

                }
                this.parliament_votes = getId();
            }

            else if (m instanceof RequestVoteResponse) {
                RequestVoteResponse recast = ((RequestVoteResponse) m);
                if (this.curr_epoque < ((RequestVoteResponse) m).getTerm()) {
                    this.curr_epoque = ((RequestVoteResponse) m).getTerm();
                    this.state.setState("follower");
                    this.parliament_votes = null;
                    if (RunOut < tick || RunOut == 999999999) {
                        resetRunOut();
                    }
                }
                if (state.getState().equals("candidate") && this.curr_epoque == ((RequestVoteResponse) m).getTerm()) {
                    this.rem_proc_call.put(((RequestVoteResponse) m).sender, 999999999);
                    if (((RequestVoteResponse) m).getVoteGranted() == 1) {
                        this.was_voted.add(((RequestVoteResponse) m).sender);
                    }
                }
            }
        }
        inbox.clear();
    }


}
