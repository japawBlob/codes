
package pjv.hodina10;

import java.util.logging.Level;
import java.util.logging.Logger;


public class Consument extends Thread{

    private final Stack stack;
    
    public Consument(Stack stack, String name){
        setName(name);
        this.stack = stack;
    }
    
    @Override
    public void run() {
        
        try{
        
            while(!isInterrupted()){
                String word = stack.pop();                
                System.out.println(getName() + " :" + word);
            }
        }
        catch(InterruptedException ex){
             System.out.println(getName()+ " - was interrupted." );
        }
    }
    
}
