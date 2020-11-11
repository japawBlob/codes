package cz.cvut.fel.agents.pdv.exclusion;

import cz.cvut.fel.agents.pdv.clocked.ClockedMessage;
import cz.cvut.fel.agents.pdv.clocked.ClockedProcess;

import java.util.*;

public class ExclusionPrimitive {

    /**
     * Stavy, ve kterych se zamek muze nachazet.
     */
    enum AcquisitionState {
        RELEASED,    // Uvolneny   - Proces, ktery vlastni aktualni instanci ExclusionPrimitive o pristup do kriticke
                     //              sekce nezada

        WANTED,      // Chteny     - Proces, ktery vlastni aktualni instanci ExclusionPrimitive zada o pristup do
                     //              kriticke sekce. Ten mu ale zatim nebyl odsouhlasen ostatnimi procesy.

        HELD         // Vlastneny  - Procesu bylo prideleno pravo pristupovat ke sdilenemu zdroji.
    }

    private ClockedProcess owner;            // Proces, ktery vlastni aktualni instanci ExclusionPrimitive

    private String criticalSectionName;      // Nazev kriticke sekce. POZOR! V aplikaci se muze nachazet vice kritickych
                                             // sekci s ruznymi nazvy!

    private String[] allAccessingProcesses;  // Seznam vsech procesu, ktere mohou chtit pristupovat ke kriticke sekci
                                             // s nazvem 'criticalSectionName' (a tak spolurozhoduji o udelovani pristupu)

    private AcquisitionState state;          // Aktualni stav zamku (vzhledem k procesu 'owner').
                                             // state==HELD znamena, ze proces 'owner' muze vstoupit do kriticke sekce

    // Doplnte pripadne vlastni datove struktury potrebne pro implementaci
    // Ricart-Agrawalova algoritmu pro vzajemne vylouceni

    private Map<String, Boolean> gotAcks;
    //private ArrayList<Integer> gotOK2;
    private int reqTime;
    private ArrayList<CustomClockedMessage> queueOfLonelyAndForgottenRequests;

    public ExclusionPrimitive(ClockedProcess owner, String criticalSectionName, String[] allProcesses) {
        this.owner = owner;
        this.criticalSectionName = criticalSectionName;
        this.allAccessingProcesses = allProcesses;

        this.gotAcks = new HashMap();
        //this.gotOK2 = new ArrayList<Integer>();
        this.reqTime = 0;
        this.queueOfLonelyAndForgottenRequests = new ArrayList<>();

        // Na zacatku je zamek uvolneny
        this.state = AcquisitionState.RELEASED;
    }

    /**
     * Metoda pro zpracovani nove prichozi zpravy
     *
     * @param m    prichozi zprava
     * @return 'true', pokud je zprava 'm' relevantni pro aktualni kritickou sekci.
     */
    public boolean accept(ClockedMessage m) {

        // Implementujte zpracovani prijimane zpravy informujici
        // o pristupech ke sdilenemu zdroji podle Ricart-Agrawalova
        // algoritmu. Pokud potrebujete posilat specificke zpravy,
        // vytvorte si pro ne vlastni tridy.
        //
        // POZOR! Ne vsechny zpravy, ktere v teto metode dostanete Vas
        // budou zajimat! Budou Vam prichazet i zpravy, ktere se  napriklad
        // tykaji jinych kritickych sekci. Pokud je zprava nerelevantni, tak
        // ji nezpracovavejte a vratte navratovou hodnotu 'false'. Nekdo jiny
        // se o ni urcite postara :-)
        //
        // Nezapomente se starat o cas procesu 'owner'
        // pomoci metody owner.increaseTime(). Aktualizaci
        // logickeho casu procesu s prijatou zpravou (pomoci maxima) jsme
        // za Vas jiz vyresili.
        //
        // Cas poslani prijate zpravy muzete zjistit dotazem na hodnotu
        // m.sentOn. Aktualni logicky cas muzete zjistit metodou owner.getTime().
        // Zpravy se posilaji pomoci owner.send(prijemce, zprava) a je jim auto-
        // maticky pridelen logicky cas odeslani. Retezec identifikujici proces
        // 'owner' je ulozeny v owner.id.

        if(!(m instanceof CustomClockedMessage)){
            return false;
        }
        CustomClockedMessage message = (CustomClockedMessage) m;
        String type = message.getType();

        if(type.equals("REQ")){
            if(message.getCriticalSection().equals(this.criticalSectionName)){
                if ((this.state.equals(AcquisitionState.WANTED) && ((this.reqTime < message.sentOn) ||
                        //If wanted check request time, lover request time continues
                    (this.reqTime == message.sentOn && this.owner.id.compareTo(message.sender) < 0))) ||
                        //resolve same request time by comparing IDs
                     this.state.equals(AcquisitionState.HELD)) {
                        //I have a boyfriend
                    queueOfLonelyAndForgottenRequests.add(message);

                } else {
                    //let's assume I am free...
                    CustomClockedMessage okMessage = new CustomClockedMessage(this.getName(), "OK", this.owner.getTime());
                    this.owner.send(message.sender, okMessage);
                }
                return true;
            }
        }
        if(type.equals("OK")){
            if(message.getCriticalSection().equals(this.criticalSectionName)){
                this.gotAcks.put(message.sender, true);
                if(!this.gotAcks.containsValue(false)){
                    this.state = AcquisitionState.HELD;
                    this.owner.increaseTime();
                }
                return true;
            }
        }
        return false;
    }

    public void requestEnter() {

        // Implementujte zadost procesu 'owner' o pristup
        // ke sdilenemu zdroji 'criticalSectionName'
        CustomClockedMessage reqMessage = new CustomClockedMessage(this.getName(), "REQ", this.owner.getTime());
        this.state = AcquisitionState.WANTED;

        for (String processID : allAccessingProcesses){
            if(Objects.equals(this.owner.id, processID)) continue;

            this.owner.send(processID, reqMessage);
            this.gotAcks.put(processID, false);
        }
        this.reqTime = this.owner.getTime();
        this.owner.increaseTime();
    }

    public void exit() {

        // Implementuje uvolneni zdroje, aby k nemu meli pristup i
        // ostatni procesy z 'allAccessingProcesses', ktere ke zdroji
        // mohou chtit pristupovat

        this.owner.increaseTime();
        this.state = AcquisitionState.RELEASED;
        this.owner.increaseTime();

        CustomClockedMessage okMessage = new CustomClockedMessage(this.getName(), "OK", this.owner.getTime());

        for(CustomClockedMessage waiting : this.queueOfLonelyAndForgottenRequests){
            this.owner.send(waiting.sender, okMessage);
            //this.queueOfLonelyAndForgottenRequests.remove(waiting);
        }
        //this.queueOfLonelyAndForgottenRequests.removeAll(queueOfLonelyAndForgottenRequests);
        this.queueOfLonelyAndForgottenRequests.clear();
    }

    public String getName() {
        return criticalSectionName;
    }

    public boolean isHeld() {
        return state == AcquisitionState.HELD;
    }

}
