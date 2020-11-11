package cz.cvut.fel.agents.pdv.swim;

import cz.cvut.fel.agents.pdv.dsand.Message;

public class ping extends Message {

    private final String ID;

    //0 for ack
    //1 for ping
    //2 for pingRequest
    //3 for dead
    private final int whoAmI;

    public ping(String ID, int whoAmI) {

        this.ID = ID;
        this.whoAmI = whoAmI;
    }

    public String getID() {
        return ID;
    }
    public int getWhoAmI() {
        return whoAmI;
    }
}
