package cz.cvut.fel.agents.pdv.student;

import cz.cvut.fel.agents.pdv.dsand.Message;
import cz.cvut.fel.agents.pdv.dsand.Pair;
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

  private int tick;
  private int currentEpoque;
  private String currentLeader;
  private String myState;
  private int timer;
  private String myVote;
  private HashMap<String, Integer> remoteProcedureCalls;
  private Set<String> votes;
  private Log log;

  public ClusterProcess(String id, Queue<Message> inbox, BiConsumer<String, Message> outbox,
      List<String> otherProcessesInCluster, int networkDelays) {
    super(id, inbox, outbox);
    this.otherProcessesInCluster = otherProcessesInCluster;
    if(networkDelays < 1){
      this.networkDelays = 1;
    } else {
      this.networkDelays = networkDelays;
    }

    this.tick = 0;
    this.currentEpoque = 0;
    this.currentLeader = null;
    this.myState = "follower";
    this.timer = 0;
    this.myVote = null;
    this.remoteProcedureCalls = new HashMap<>();
    this.votes = new HashSet<>();
    this.log = new Log();


  }

  @Override
  public Optional<Map<String, String>> getLastSnapshotOfLog() {

    // komentar viz deklarace
    return Optional.empty();
  }

  @Override
  public String getCurrentLeader() {

    return this.currentLeader;
  }

  private void resetTimer() {
    //this.timer = this.tick + current().nextInt(5 * this.networkDelays, 10 * this.networkDelays);
    /*if(networkDelays < 1){
      this.networkDelays = 1;
    }*/
    timer = this.tick + current().nextInt(5 * this.networkDelays, 11 * (this.networkDelays));
    //System.out.println(timer);
  }

  @Override
  public void act() {
    // doimplementuje metodu act() podle RAFT

    // krome vlastnich zprav (vasich trid), dostavate typy zprav z balicku raft.messages s rodicem
    // ClientRequest, tak si je projdete, at vite, co je ucelem a obsahem jednotlivych typu.
    // V pripade ClientRequestWithContent dostavate zpravu typu
    // ClientRequestWithContent<StoreOperationEnums, Pair<String, String>>, kde StoreOperationEnums
    // je operace, kterou mate udelat s obsahem paru Pair<String, String>, kde prvni hodnota
    // paru je klic (nikdy neni prazdny) a druha je hodnota (v pripade pozadavku GET je prazdny)

    // dejte si pozor na jednotlive akce podle RAFT. S klientem komunikujte vyhradne pomoci zprav
    // typu ServerResponse v messages

    // na pozadavky klientu odpovidate zpravami typu ServerResponse viz popis podtypu v messages.
    // !!! V TOMTO PRIPADE JE 'requestId' ROVNO POZADAVKU KLIENTA, NA KTERY ODPOVIDATE !!!

    // dalsi podrobnosti naleznete na strance se zadanim
    this.tick++;
    //System.out.println(myState);
    if((this.myState.equals("follower") || this.myState.equals("candidate")) && timer < tick){
      resetTimer();
      this.currentEpoque++;
      this.myState = "candidate";
      this.myVote = this.getId();
      for (String blob : otherProcessesInCluster){
        //remoteProcedureCalls.put(blob, 0);
      }
    }
    //System.out.println(this.votes.size());
    if(this.myState.equals("candidate") && ((this.votes.size() + 1) > this.otherProcessesInCluster.size() / 2)){
      this.myState = "leader";
      this.currentLeader = this.getId();

      for(String blob : this.otherProcessesInCluster){
        //this.remoteProcedureCalls.put(blob, 0);
      }
      this.timer = 0x002347;
    }

    for(String blob : this.otherProcessesInCluster){
      if(this.myState.equals("candidate")/* && (this.remoteProcedureCalls.get(blob) <= this.tick)*/){
        //this.remoteProcedureCalls.put(blob, networkDelays);
        //CustomMessage ooze = new CustomMessage(this.currentEpoque, this.getId(), "voteRequest");
        send(blob, new CustomMessage(this.currentEpoque, this.getId(), "voteRequest"));
      }

      if(this.myState.equals("leader")){
        //CustomMessage ooze = new CustomMessage(this.currentEpoque, getId(), "appendEntries")
        send(blob, new CustomMessage(this.currentEpoque, this.getId(), "appendEntries"));
      }

    }
    for (Message m : inbox){
      if(m instanceof CustomMessage){
        if (((CustomMessage) m).getTypeOfMessage().equals("voteRequest")){
          //System.out.println("voteReqHandle");
          CustomMessage currentMessage = (CustomMessage) m;
          boolean approve = false;
          //System.out.println("this.currentEpoque " + this.currentEpoque +" message epoq "+ currentMessage.getEpoque());
          if(this.currentEpoque == currentMessage.getEpoque() && (this.myVote == null || this.myVote == currentMessage.sender)){
            this.myVote = currentMessage.sender;
            resetTimer();
            approve = true;
          }
          //System.out.println(approve);
          //CustomMessage ooze = new CustomMessage(this.currentEpoque, approve, "voteResponse");
          send(currentMessage.getId(), new CustomMessage(this.currentEpoque, approve, "voteResponse"));
        } else
        if (((CustomMessage) m).getTypeOfMessage().equals("appendEntries")){
          //System.out.println("appendEntriesAHandle");
          CustomMessage currentMessage = (CustomMessage) m;
          if(this.currentEpoque < currentMessage.getEpoque()){
            this.currentEpoque = currentMessage.getEpoque();
            this.myState = "follower";
            this.myVote = null;
            if(this.timer < tick || this.timer == 0x002347){
              resetTimer();
            }
          } else
          if(this.currentEpoque == currentMessage.getEpoque()){
            this.myState = "follower";
            this.currentLeader = currentMessage.getId();
            resetTimer();
          }
          this.myVote = this.getId();
        } else
        if (((CustomMessage) m).getTypeOfMessage().equals("voteResponse")){
          //System.out.println("voteResponseHandle");
          CustomMessage currentMessage = (CustomMessage) m;
          if(currentMessage.isVote()){
            //System.out.println("here");
          }
          if(this.currentEpoque < currentMessage.getEpoque()){
            this.currentEpoque = currentMessage.getEpoque();
            this.myState = "follower";
            this.myVote = null;
            if (timer == 0x002347 || timer < tick){
              resetTimer();
            }
          }
          if (this.myState.equals("candidate") && currentEpoque == currentMessage.getEpoque()){
            //System.out.println("here?");
            //this.remoteProcedureCalls.put(currentMessage.sender, 0);
            if(currentMessage.isVote()){
              this.votes.add(currentMessage.sender);
            }
          }


        }
      }
    }
    inbox.clear();
  }
}
