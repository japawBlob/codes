package cz.cvut.fel.agents.dsand.bfs;

import cz.cvut.fel.agents.dsand.DSProcess;
import cz.cvut.fel.agents.dsand.Message;

import java.beans.beancontext.BeanContextServiceAvailableEvent;
import java.util.List;
import java.util.Queue;
import java.util.function.BiConsumer;

public class BFSProcess extends DSProcess {

    /**
     * Seznam nasledniku uzlu spravovaneho aktualnim procesem
     */
    private List<String> neighbors;

    /**
     * Je uzel spravovany aktualnim procesem 'root' prohledavani?
     */
    private boolean isRoot;

    /**
     * Je uzel spravovany aktualnim procesem cilovym uzlem?
     */
    private boolean isGoal;

    /**
     * Identifikator predchazejiciho procesu ('uzlu' na nejkratsi ceste)
     */
    private String predecessor = null;

    private boolean closed = false;

    public BFSProcess(String id, Queue<Message> inbox, BiConsumer<String, Message> outbox,
                      List<String> neighbors, boolean isRoot, boolean isGoal) {
        super(id, inbox, outbox);
        this.neighbors = neighbors;
        this.isRoot = isRoot;
        this.isGoal = isGoal;

        // Pro jednoduchost nastavime predchazeji proces korene na koren samotny.
        if(isRoot) predecessor = id;
    }

    @Override
    public void act() {

        /*
            Doplnte algoritmus, ktery bude vykonavat kazdy proces

            1) Zpracujte prichozi zpravy v 'inbox'
            2) Vytvorte tridy pro posilane zpravy
            3) Doplnte logiku reakce na zpravu a odeslani novych zprav
        */

        // odeslani prvni zpravy
        if(isRoot && !closed){
            closed = true;
            for(String blob: neighbors){
                send(blob, new SearchMessage());
            }
        }


        // zpracovani inboxu
        while(!inbox.isEmpty()){
            Message m = inbox.poll();
            System.out.printf("%s RECIVED from %s: %s", id, m.sender, m);

            if(m instanceof SearchMessage && !closed){
                for(String blob: neighbors){
                    send(blob, new SearchMessage());
                }
            }
            closed = true;
        }
        // nalezeni cile
        if(isGoal && closed){
            terminateAll();
        }
    }

    @Override
    public boolean isTerminated() {
        return false;
    }

    @Override
    protected void send(String rcpt, Message m){
        System.out.printf("%s RECIVED from %s: %s", id, rcpt, m);
        super.send(rcpt, m);
    }
}
