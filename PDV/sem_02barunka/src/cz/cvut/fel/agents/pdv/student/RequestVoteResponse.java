package cz.cvut.fel.agents.pdv.student;

import cz.cvut.fel.agents.pdv.dsand.Message;

class RequestVoteResponse extends Message {

    Integer term;
    Integer voteGranted;

    RequestVoteResponse(Integer term, Integer voteGranted) {
        this.term = term;
        this.voteGranted= voteGranted;
    }

    public Integer getVoteGranted() {
        return voteGranted;
    }

    public void setVoteGranted(Integer voteGranted) {
        this.voteGranted = voteGranted;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }
}
