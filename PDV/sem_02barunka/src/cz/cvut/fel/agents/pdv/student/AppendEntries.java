package cz.cvut.fel.agents.pdv.student;

import cz.cvut.fel.agents.pdv.dsand.Message;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

class AppendEntries extends Message{
    int term;
    String leaderId;


    AppendEntries(int term, String leaderId) {
        this.term = term;
        this.leaderId = leaderId;

    }

}

