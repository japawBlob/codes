package cz.cvut.fel.agents.pdv.exclusion;

import cz.cvut.fel.agents.pdv.clocked.ClockedMessage;

public class CustomClockedMessage extends ClockedMessage {
    private String type;
    private String criticalSection;

    public CustomClockedMessage(String criticalSection, String type, int sentOn) {
        this.type = type;
        this.criticalSection = criticalSection;
        this.sentOn = sentOn;
    }

    public CustomClockedMessage(String criticalSection, String type) {
        this.type = type;
        this.criticalSection = criticalSection;
    }
    public CustomClockedMessage(){
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCriticalSection() {
        return criticalSection;
    }

    public void setCriticalSection(String criticalSection) {
        this.criticalSection = criticalSection;
    }
}
