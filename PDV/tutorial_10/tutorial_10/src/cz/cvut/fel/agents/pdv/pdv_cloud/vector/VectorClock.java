package cz.cvut.fel.agents.pdv.pdv_cloud.vector;

import cz.cvut.fel.agents.pdv.pdv_cloud.cloud_utils.IClock;
import cz.cvut.fel.agents.pdv.pdv_cloud.cloud_utils.IProcessClock;

import java.util.Arrays;

/**
 * Trida reprezentujici vektorove hodiny procesu.
 */
public class VectorClock implements IProcessClock<int[]> {

    private final int[] vectorTime;

    // id procesu - vlastnika hodin
    private final int myID;

    public VectorClock(int processes, int myID) {
        this.vectorTime = new int[processes];
        this.myID = myID;
    }

    @Override
    public void update(IClock<int[]> timestamp) {

        // TODO
        // implementujte pravidlo pro aktualizaci lokalnich hodin
        // na zaklade casove znamky z prijate zpravy
        for (int i = 0; i<vectorTime.length;i++){
            vectorTime[i] = Math.max(vectorTime[i], timestamp.getTime()[i]);
        }
        vectorTime[myID]++;
    }

    @Override
    public void onNewEvent() {

        // TODO
        // implementujte logiku zmeny logickych hodin s novou udalosti
        vectorTime[myID]++;
    }


    @Override
    public IClock<int[]> getAsTimeStamp() {
        return new VectorTimestamp(vectorTime.clone());
    }

    @Override
    public int[] getTime() {
        return vectorTime;
    }

    @Override
    public boolean isCausalityForProcessViolated(IClock<int[]> timestamp, int process) {

        // TODO
        // implementujte detekci poruseni kauzality na zaklade
        // porovnani lokalnich hodin a casove znamky zpravy od procesu

        return vectorTime[process] > timestamp.getTime()[process];
    }

    @Override
    public String toString() {
        return Arrays.toString(vectorTime);
    }
}
