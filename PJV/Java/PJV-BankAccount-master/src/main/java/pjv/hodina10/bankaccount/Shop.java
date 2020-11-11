
package pjv.hodina10.bankaccount;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Shop {
    
    List<Person> customers;
    double [] bills;
    
    List<Thread> threads = new ArrayList();
    
    
    public Shop(List<Person> customers, double [] bills){
        this.customers = customers;
        this.bills = bills;
    }
    
    public void makeCustomersPayBills() throws InterruptedException{
         for(Person customer : customers){
            for(double payment : bills){
                
                Thread thread = new Thread(new Runnable(){
                    @Override
                    public void run() {
                        try {
                            customer.removeAmountFromBankAccount(payment);
                        } catch (InterruptedException ex) {
                            System.out.println("Interruted");
                        }
                    }
                    
                });
                threads.add(thread);
                thread.start();
                
            }
        }
         for(Thread thread : threads){
             thread.join();
         }
    }
    
}
