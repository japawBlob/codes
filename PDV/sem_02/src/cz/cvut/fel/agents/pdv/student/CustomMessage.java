package cz.cvut.fel.agents.pdv.student;

import cz.cvut.fel.agents.pdv.dsand.Message;

class CustomMessage extends Message {
    private int epoque;
    private String Id;
    private String typeOfMessage;
    private boolean vote;

    CustomMessage(int epoque, String Id, String typeOfMessage) {
        this.epoque = epoque;
        this.Id = Id;
        this.typeOfMessage = typeOfMessage;
    }
    CustomMessage(int term, boolean vote, String typeOfMessage) {
        this.epoque = term;
        this.typeOfMessage = typeOfMessage;
        this.vote = vote;
    }

    public int getEpoque() {
        return epoque;
    }

    public void setEpoque(int term) {
        this.epoque = term;
    }

    public String getId() {
        return Id;
    }

    public void setId(String id) {
        this.Id = id;
    }

    public String getTypeOfMessage() {
        return typeOfMessage;
    }

    public void setTypeOfMessage(String typeOfMessage) {
        this.typeOfMessage = typeOfMessage;
    }

    public boolean isVote() {
        return vote;
    }

    public void setVote(boolean vote) {
        this.vote = vote;
    }
}