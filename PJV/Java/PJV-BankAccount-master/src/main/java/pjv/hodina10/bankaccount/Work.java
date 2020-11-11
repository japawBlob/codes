
package pjv.hodina10.bankaccount;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Work {    
    private List<Person> employees;
    private double [] payments; 
    
    List<Thread> threads = new ArrayList();
    
    public Work(List<Person> employees, double [] payments){
        this.employees = employees;
        this.payments = payments;
    }
    
    public void payPayments() throws InterruptedException{
        for(Person employee : employees){
            for(double payment : payments){
               Thread thread = new Thread (new Runnable(){
                    @Override
                    public void run() {
                        try {
                            employee.addAmountToBankAccount(payment);
                        } catch (InterruptedException ex) {
                            Logger.getLogger(Work.class.getName()).log(Level.SEVERE, null, ex);
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
