package cz.cvut.fel.agents.pdv.swim;

import cz.cvut.fel.agents.pdv.dsand.Message;
import cz.cvut.fel.agents.pdv.dsand.Pair;

import java.util.*;
import java.util.Map.Entry;
import java.util.HashMap;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * Trida s implementaci metody act() pro proces Failure Detector. Tuto tridu (a tridy pouzivanych zprav) budete
 * odevzdavat. Do tridy si muzete doplnit vlastni pomocne datove struktury. Hodnoty muzete inicializovat primo
 * v konstruktoru. Klicova je metoda act(), kterou vola kazda instance tridy FailureDetectorProcess ve sve metode
 * act(). Tuto metodu naimplementujte podle protokolu SWIM predstaveneho na prednasce.
 *
 * Pokud si stale jeste nevite rady s frameworkem, inspiraci muzete nalezt v resenych prikladech ze cviceni.
 */
public class ActStrategy {

    // maximalni zpozdeni zprav
    private final int maxDelayForMessages;
    private List<String> otherProcesses;

    // Definujte vsechny sve promenne a datove struktury, ktere budete potrebovat
    private final Map<String,Boolean> requestedPings;
    private final Map<String, HashSet<String>> callbacks;
    private int clock;
    private final Map<String,Integer> lastSent;

    public ActStrategy(int maxDelayForMessages, List<String> otherProcesses,
                       int timeToDetectKilledProcess, int upperBoundOnMessages) {
        this.maxDelayForMessages = maxDelayForMessages;
        this.otherProcesses = otherProcesses;

        // Doplnte inicializaci
        this.requestedPings = new HashMap<>();
        this.lastSent = new HashMap<>();
        this.callbacks = new HashMap<String, HashSet<String>>();
        this.clock = 0;

        Collections.shuffle(otherProcesses);
    }

    /**
     * Metoda je volana s kazdym zavolanim metody act v FailureDetectorProcess. Metodu implementujte
     * tak, jako byste implementovali metodu act() v FailureDetectorProcess, misto pouzivani send()
     * pridejte zpravy v podobe paru - prijemce, zprava do listu. Zpravy budou nasledne odeslany.
     * <p>
     * Diky zavedeni teto metody muzeme kontrolovat pocet odeslanych zprav vasi implementaci.
     */
    public List<Pair<String, Message>> act(Queue<Message> inbox, String disseminationProcess) {

        // Od DisseminationProcess muzete dostat zpravu typu DeadProcessMessage, ktera Vas
        // informuje o spravne detekovanem ukoncenem procesu.
        // DisseminationProcess muzete poslat zpravu o detekovanem "mrtvem" procesu.
        // Zprava musi byt typu PFDMessage.
        List<Pair<String, Message>> arr = new ArrayList<>();

        while (!inbox.isEmpty()){
            Message tmp = inbox.poll();

            if(tmp instanceof PingMessage){
                arr.add(new Pair<>(tmp.sender, new AckMessage(tmp.recipient)));
                if(this.callbacks.containsKey(tmp.sender)){
                    for(String waiter : this.callbacks.get(tmp.sender)){
                        arr.add(new Pair<>(waiter, tmp));
                    }
                }
                PingMessage tmping = (PingMessage) tmp;
                this.lastSent.remove(tmping.getProcessID());
                this.requestedPings.remove(tmping.getProcessID());
            }

            else if(tmp instanceof PingRequest){
                PingRequest pingreqmsg = (PingRequest)tmp;
                if(this.callbacks.containsKey(pingreqmsg.getProcessID())){
                    this.callbacks.get(pingreqmsg.getProcessID()).add(pingreqmsg.sender);
                } else {
                    this.callbacks.put(pingreqmsg.getProcessID(), new HashSet<>());
                    this.callbacks.get(pingreqmsg.getProcessID()).add(pingreqmsg.sender);
                }
                arr.add(new Pair<>(pingreqmsg.getProcessID(), new PingMessage(pingreqmsg.getProcessID())));
            }

            else if(tmp instanceof AckMessage){
                AckMessage ackmsg = (AckMessage)tmp;
                if(this.callbacks.containsKey(ackmsg.getProcessID())){
                    for(String waiter : this.callbacks.get(ackmsg.getProcessID())){
                        arr.add(new Pair<>(waiter, ackmsg));
                    }
                }
                this.lastSent.remove(ackmsg.getProcessID());
                this.requestedPings.remove(ackmsg.getProcessID());
            }

            else if(tmp instanceof DeadProcessMessage){
                DeadProcessMessage deadmsg = (DeadProcessMessage)tmp;
                this.otherProcesses = this.otherProcesses.stream().filter(x -> !x.equals(deadmsg.getProcessID())).collect(Collectors.toList());
            }

        }

        Random randomGenerator = new Random();
        if(this.clock%2 == 1){
            String currPingTarget = this.otherProcesses.get(randomGenerator.nextInt(this.otherProcesses.size()));
            PingMessage msg = new PingMessage(currPingTarget);
            arr.add(new Pair<>(currPingTarget, msg));
            lastSent.put(currPingTarget, this.clock);
        }

        String key = "null";
        for(Entry<String, Integer> pinged : this.lastSent.entrySet()){
            if(pinged.getValue() < this.clock - 6*this.maxDelayForMessages){
                arr.add(new Pair<>(disseminationProcess, new PFDMessage(pinged.getKey())));
                key = pinged.getKey();
                continue;
            }
            if(pinged.getValue() < this.clock - 2*this.maxDelayForMessages && !this.requestedPings.containsKey(pinged.getKey())){
                List<String> cpy = this.otherProcesses;
                Collections.shuffle(cpy);
                cpy = cpy.subList(0,10);
                for(int i = 0; i < 7; i++){
                    String tmp = cpy.get(i);
                    PingRequest tmpmsg = new PingRequest(pinged.getKey());
                    arr.add(new Pair<>(tmp, tmpmsg));
                }
                this.requestedPings.put(pinged.getKey(), true);
            }
        }

        if(key.equals("null")){
            this.lastSent.remove(key);
        }

        this.clock++;
        arr = arr.stream().distinct().collect(Collectors.toList());
        return arr;
    }
}
