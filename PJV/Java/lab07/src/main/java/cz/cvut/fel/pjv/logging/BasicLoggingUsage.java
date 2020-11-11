package cz.cvut.fel.pjv.logging;

import java.util.logging.Logger;

public class BasicLoggingUsage {

    private static final Logger LOG = Logger.getLogger(BasicLoggingUsage.class.getName());

    public static void main(String[] args) {
        LOG.severe("Severe message");
        LOG.info("Info message");
        LOG.finest("Finest message");
    }

}
