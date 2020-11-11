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

    private Map<String, Integer> gotOk;
    private Integer reqTime;
    private ArrayList<ClockedMessageExt> reqMess;

    // Doplnte pripadne vlastni datove struktury potrebne pro implementaci
    // Ricart-Agrawalova algoritmu pro vzajemne vylouceni

    public ExclusionPrimitive(ClockedProcess owner, String criticalSectionName, String[] allProcesses) {
        this.owner = owner;
        this.criticalSectionName = criticalSectionName;
        this.allAccessingProcesses = allProcesses;
        this.gotOk = new HashMap();
        this.reqTime = 0;
        this.reqMess = new ArrayList<>();

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
        boolean ret = false;
        if(m instanceof ClockedMessageExt){
            ClockedMessageExt tmp = (ClockedMessageExt) m;
            if(tmp.type.equals("REQ")){
                //System.out.println("acc req start");
                if(tmp.cSectionName.equals(this.criticalSectionName)){
                    //System.out.println("is relevant");
                    if((this.state == AcquisitionState.WANTED && ((this.reqTime < tmp.sentOn) || (this.reqTime == tmp.sentOn && owner.id.compareTo(tmp.sender) < 0))) || this.state == AcquisitionState.HELD){
                        //System.out.println("add to queue");
                        reqMess.add(tmp);
                        //System.out.println("added to q");
                    } else {
                        //System.out.println("send OK");
                        ClockedMessageExt temp = new ClockedMessageExt();
                        temp.type = "OK";
                        temp.cSectionName = getName();
                        temp.sentOn = this.owner.getTime();
                        this.owner.send(tmp.sender, temp);
                    }
                    ret = true;
                    //System.out.println("acc req");
                }
            } else if(tmp.type.equals("OK")){
                //System.out.println("acc OK start");
                if(tmp.cSectionName.equals(this.criticalSectionName)){
                    this.gotOk.put(tmp.sender, 1);
                    boolean ok = true;
                    for(Map.Entry<String, Integer> map  : this.gotOk.entrySet()){
                        if(map.getValue() != 1){
                            ok = false;
                            break;
                        }
                    }
                    if(ok){
                        this.state = AcquisitionState.HELD;
                        this.owner.increaseTime();
                        ok = false;
                    }
                    ret = true;

                    //System.out.println("acc OK");
                }
            }
        }

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

        return ret;

    }

    public void requestEnter() {

        // Implementujte zadost procesu 'owner' o pristup
        // ke sdilenemu zdroji 'criticalSectionName'
        ClockedMessageExt temp = new ClockedMessageExt();
        temp.type = "REQ";
        temp.cSectionName = getName();
        temp.sentOn = this.owner.getTime();
        this.state = AcquisitionState.WANTED;

        for (String process : allAccessingProcesses){
            if(!Objects.equals(this.owner.id, process)){
                this.owner.send(process, temp);
                this.gotOk.put(process,0);
            }
        }
        this.reqTime = this.owner.getTime();
        this.owner.increaseTime();

        //System.out.println("req");
    }

    public void exit() {

        // Implementuje uvolneni zdroje, aby k nemu meli pristup i
        // ostatni procesy z 'allAccessingProcesses', ktere ke zdroji
        // mohou chtit pristupovat
        //System.out.println("exit start");

        this.owner.increaseTime();
        this.state = AcquisitionState.RELEASED;
        this.owner.increaseTime();

        ClockedMessageExt temp = new ClockedMessageExt();
        temp.type = "OK";
        temp.cSectionName = getName();
        temp.sentOn = this.owner.getTime();
        for(ClockedMessageExt tmp : this.reqMess){
            this.owner.send(tmp.sender, temp);
        }
        this.reqMess.removeAll(reqMess);

        //System.out.println("exit");
    }

    public String getName() {
        return criticalSectionName;
    }

    public boolean isHeld() {
        return state == AcquisitionState.HELD;
    }

}
