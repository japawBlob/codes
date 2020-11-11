/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pjv.hodina10;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Producent extends Thread{
    
    private final File dataFile;
    private final Stack stack;
        
    /**
     *  
     * @param dataFile File from where words will be read.
     * @param stack Each read word will be added to stack.
     */
    public Producent(File dataFile, Stack stack) {
        this.dataFile = dataFile;
        this.stack = stack;
    }
    
    /**
     * Reads words from file, each read word is added to the stack.
     */
    @Override
    public void run() {
        try {
            BufferedReader bufr = new BufferedReader(
                new InputStreamReader(new FileInputStream(dataFile), "UTF-8"));
            String line;
            while((line = bufr.readLine()) != null){
                String [] splittedLine = line.trim().split("\\s+");
                
                for(String word : splittedLine){
                    stack.add(word);
                }
                
            }
            
            bufr.close();
        } catch (IOException ex) {
            Logger.getLogger(Producent.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
 
    
    
}
