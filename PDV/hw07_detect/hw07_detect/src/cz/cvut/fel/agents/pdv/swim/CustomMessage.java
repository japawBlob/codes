package cz.cvut.fel.agents.pdv.swim;

import cz.cvut.fel.agents.pdv.dsand.Message;

public class CustomMessage extends Message {

    private final String ID;

    //0 for ack
    //1 for ping
    //2 for pingRequest
    //3 for dead
    private int whoAmI;

    public CustomMessage(String ID, int whoAmI) {

        this.ID = ID;
        this.whoAmI = whoAmI;
    }
    public CustomMessage(String ID) {

        this.ID = ID;
    }

    public void setWhoAmI(int whoAmI){
        this.whoAmI = whoAmI;
    }

    public String getID() {
        return ID;
    }
    public int getWhoAmI() {
        return whoAmI;
    }
}
