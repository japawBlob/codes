package cz.cvut.fel.agents.pdv.swim;

import cz.cvut.fel.agents.pdv.dsand.Message;
import cz.cvut.fel.agents.pdv.dsand.Pair;

import java.util.*;
import java.util.Map.Entry;
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
    private final List<String> otherProcesses;

    // Definujte vsechny sve promenne a datove struktury, ktere budete potrebovat
    int clock;
    HashMap<String, HashSet<String>> callbacks;
    HashMap<String, Integer> lastSent;
    int limit;
    HashMap<String, Boolean> requestedPings;


    public ActStrategy(int maxDelayForMessages, List<String> otherProcesses,
                       int timeToDetectKilledProcess, int upperBoundOnMessages) {
        this.maxDelayForMessages = maxDelayForMessages;
        this.otherProcesses = otherProcesses;

        // Doplne inicializaci
        this.callbacks = new HashMap<String, HashSet<String>>();
        this.lastSent = new HashMap<>();
        this.requestedPings = new HashMap<>();
        this.clock = 0;
        this.limit = 5*maxDelayForMessages;
    }

    /**
     * Metoda je volana s kazdym zavolanim metody act v FailureDetectorProcess. Metodu implementujte
     * tak, jako byste implementovali metodu act() v FailureDetectorProcess, misto pouzivani send()
     * pridejte zpravy v podobe paru - prijemce, zprava do listu. Zpravy budou nasledne odeslany.
     * <p>
     * Diky zavedeni teto metody muzeme kontrolovat pocet odeslanych zprav vasi implementaci.
     */
//    public List<Pair<String, Message>> act(Queue<CustomMessage> inbox, String disseminationProcess) {
    public List<Pair<String, Message>> act(Queue<Message> inbox, String disseminationProcess) {

        // Od DisseminationProcess muzete dostat zpravu typu DeadProcessMessage, ktera Vas
        // informuje o spravne detekovanem ukoncenem procesu.
        // DisseminationProcess muzete poslat zpravu o detekovanem "mrtvem" procesu.
        // Zprava musi byt typu PFDMessage.

        ArrayList<Pair<String, Message>> retval = new ArrayList<Pair<String, Message>>();

        Message current;
        CustomMessage blob;
        Pair newPair;
        while((current = inbox.poll()) != null){
            int whatToDo = 2347;
            //int whatToDo = CustomMessage.getWhoAmI();

            //0 for ack
            //1 for ping
            //2 for pingRequest
            //3 for dead
            if (current instanceof CustomMessage){
                whatToDo = ((CustomMessage) current).getWhoAmI();
            }
            if (whatToDo == 2347) continue;
            blob = (CustomMessage) current;
            CustomMessage newMessage;
            switch (whatToDo) {
                //ack
                case 0:
                    if (callbacks.containsKey(blob.getID())) {
                        for (String str : callbacks.get(blob.getID())) {
                            newPair = new Pair<>(str, blob);
                            retval.add(newPair);
                        }
                    }
                    lastSent.remove(blob.getID());
                    break;
                //ping
                case 1:
                    newMessage = new CustomMessage(blob.recipient, 0);
                    newPair = new Pair<>(blob.sender, newMessage);
                    retval.add(newPair);
                    break;
                //pingRequest
                case 2:
 /**/               if (!callbacks.containsKey(blob.getID())) {
                        callbacks.put(blob.getID(), new HashSet<>());
                    }
                    callbacks.get(blob.getID()).add(blob.sender);
                    newMessage = new CustomMessage(blob.recipient, 1);
                    newPair = new Pair<>(blob.getID(), newMessage);
                    retval.add(newPair);
                    break;
                //dead
                case 3:
                    otherProcesses.remove(blob.getID());
                    break;
            }
        }
        Random randomGenerator = new Random();
        if(clock%3 == 1){
            String currPingTarget = otherProcesses.get(randomGenerator.nextInt(otherProcesses.size()));
            blob = new CustomMessage(currPingTarget, 1);
            if(!lastSent.containsKey(currPingTarget)){
                newPair = new Pair<>(currPingTarget, blob);
                retval.add(newPair);

                lastSent.putIfAbsent(currPingTarget, clock);
            }
        }
        for(Entry<String, Integer> pinged : lastSent.entrySet()){
            if(pinged.getValue() < clock - 6*maxDelayForMessages){
                PFDMessage msg = new PFDMessage(pinged.getKey());
                newPair = new Pair<>(disseminationProcess, msg);
                retval.add(newPair);
                continue;
            }
            if(pinged.getValue() < clock - 2*maxDelayForMessages && !requestedPings.containsKey(pinged.getKey())){
                Collections.shuffle(otherProcesses);
                //kolika procesum chci pingnout if dead od 5 do desiti
                for(int i = 0; i < 6; i++){
                    blob = new CustomMessage(pinged.getKey(), 2);
                    newPair = new Pair<>(otherProcesses.get(i), blob);
                    retval.add(newPair);
                }
                this.requestedPings.putIfAbsent(pinged.getKey(), true);
            }
        }
        clock++;

        return retval;
    }

}
