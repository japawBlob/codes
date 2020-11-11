package pjv.hodina10;

import java.io.File;
import java.io.FilenameFilter;
import java.util.logging.Level;
import java.util.logging.Logger;


public class PJVHodina10 {

    /**
     * @param args the command line arguments
     */
    
    
    
    public static void main(String[] args) {     
        
        Stack stack = null;
        
        //inicialize producers
        Producent [] producentArray = inicializeProducers(stack);
        
        //inicialize consuments
        Consument [] consumentsArray = inicializeConsuments(stack);
        
        waitForProducents(producentArray);
        
        waitForConsuments(stack);
        
        //Interrupt consumers
         for(int i = 0; i < consumentsArray.length; i++){
            consumentsArray[i].interrupt();
         }
        
    }
    
    private static Producent [] inicializeProducers(Stack stack) {
        File [] files = new File(".").listFiles(txtFilter);        
        Producent [] producentArray = new Producent[files.length];        
        for(int i = 0; i < producentArray.length; i++){            
            Producent producent = new Producent(files[i], stack);
            producentArray[i] = producent;
            producent.start();
        }
        return producentArray;
    }
    
    private static Consument [] inicializeConsuments(Stack stack) {
        int countOfConsuments = 2;        
        Consument [] consumentsArray = new Consument[countOfConsuments];        
        for(int i = 0; i < consumentsArray.length; i++){
            Consument consument = new Consument(stack, "cosument_" + i);
            consumentsArray[i] = consument;
            consument.start();
        }
        return consumentsArray;
    }
    
    private static void waitForProducents(Producent [] producents){
        for(int i = 0; i < producents.length; i++){     
            try {
                producents[i].join();
            } catch (InterruptedException ex) {
                Logger.getLogger(PJVHodina10.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    private static void waitForConsuments(Stack stack){
        while(!stack.isEmpty()){
            try {
                Thread.sleep(100);
            } catch (InterruptedException ex) {
                Logger.getLogger(PJVHodina10.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    private static FilenameFilter txtFilter = new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                return name.endsWith(".txt");
            }
        };
    
}
