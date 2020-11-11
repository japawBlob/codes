package cz.cvut.fel.agents.pdv.student;

import cz.cvut.fel.agents.pdv.dsand.Message;

class RequestVote extends Message {
    int term;
    String candidateId;


    RequestVote(int term, String candidateId) {
        this.term = term;
        this.candidateId = candidateId;

    }
}
