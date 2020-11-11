package pjv.hodina10.bankaccount;

import java.util.logging.Level;
import java.util.logging.Logger;


public class Person {
    
    private BankAccount bankAccount;
    public final int personId;
    
    
    public Person(BankAccount bankAccount, int personId) {
        this.bankAccount = bankAccount;
        this.personId = personId;
    }
    
    public void addAmountToBankAccount(double amount) throws InterruptedException{
        bankAccount.addAmount(amount);
    }
    public void removeAmountFromBankAccount(double amount) throws InterruptedException{
        bankAccount.addAmount(-amount);
    }
    
    @Override
    public String toString(){
        
        String returnString = null;
        try {
            returnString = "person_" + personId+" bankAccountBallance: "
                    + bankAccount.getBalance();
        } catch (InterruptedException ex) {
            Logger.getLogger(Person.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return returnString;
    }
    
}
