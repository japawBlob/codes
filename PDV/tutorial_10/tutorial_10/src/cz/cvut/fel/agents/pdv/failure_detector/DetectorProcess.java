package cz.cvut.fel.agents.pdv.failure_detector;

import cz.cvut.fel.agents.pdv.dsand.DSProcess;
import cz.cvut.fel.agents.pdv.dsand.Message;

import java.util.*;
import java.util.function.BiConsumer;

/**
 * Trida DetectorProcess. Ukolem kazde instance je detekovat ukoncene procesy pomoci all-to-all heartbeat algoritmu.
 * Krome implementace samotne metody act() budete pravdepodobne potrebovat zavest pomocne datove struktury.
 *
 * V metode act() mate napovedu k postupu.
 * Pokud si stale jeste nevite rady s frameworkem, inspiraci muzete nalezt v resenych prikladech ze cviceni.
 */
public class DetectorProcess extends DSProcess {

    // parametry posilani zprav
    // jak casto se maji zpravy posilat
    private final int period;
    // limit k prijeti heartbeatu
    private final int timeout;

    // interni pocitadlo, kolikrat byl proces vzbuzen
    // procesy se budi v kazdem kroku simulace vsechny
    // jejich wakeCounters tedy nemaji zadny drift
    private int wakeCount = 0;


    // TODO
    // doplnte vlastni datove struktury
    Map<String, Integer> processTimes;
    Set<String> processDead = new HashSet<>();
    // vsechny procesy
    private final List<String> ALL_PROCESSES;

    public DetectorProcess(String id, Queue<Message> inbox, BiConsumer<String, Message> outbox,
                           int maxDelay, List<String> processes) {
        super(id, inbox, outbox);

        this.period = 10;
        this.ALL_PROCESSES = processes;

        // TODO
        // Nastavte timeout
        this.timeout = period+maxDelay;

        // TODO
        // inicializujte vlastni datove struktury
        processTimes = new HashMap<>();
        for(String process : ALL_PROCESSES){
            processTimes.put(process, 0);
        }
    }

    @Override
    public void act() {

        // Muzete predpokladat, ze se zpravy neztraceji, jen zpozduji...
        // 1. zajistete, ze se s kazdou periodou poslou heartbeats vsem ostatnim procesum
        if(wakeCount % period == 0){
            for(String process : ALL_PROCESSES){
                if(!process.equals(id)){
                    send(process, new HeartbeatMessage());
                }
            }
        }
        // 2. pokud obdrzite heartbeat od jineho procesu, aktualizujte si databazi zivych procesu
        while(!inbox.isEmpty()){
            Message message = inbox.poll();
            processTimes.put(message.sender, wakeCount);
        }
        // 3. detekujte havarovane procesy, takovy proces vypiste prave jednou
        for(String process : ALL_PROCESSES){
            if(!process.equals(id) && !processDead.contains(process)){
                if(processTimes.get(process) < wakeCount - timeout);
                processDead.add(process);
                System.out.println(id + ": Process " + process + "died.");
            }
        }




        // inkrementujeme citac probuzeni procesu
        wakeCount++;
    }
}
