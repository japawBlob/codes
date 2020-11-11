package cz.cvut.fel.pjv;

public class Test {
    
    public void start() {
        String password = "ubalimt";
        BruteForceAttacker attacker = new BruteForceAttacker();
        attacker.init(new char[]{'a', 'b', 'c', 'd', 'e', 'f', 'g' ,'h' ,'i', 'j', 'k', 'l', 'm' ,'n','o','p','q','r','s','t','u','v','w','x','y','z'}, password);
        
        System.out.println("Trying to break password...");
        attacker.breakPassword(password.length());
        
        if (attacker.isOpened()) {
            System.out.println("[VAULT] opened, password is " + password);
        } else {
            System.out.println("[VAULT] is still closed");
        }
    }
}