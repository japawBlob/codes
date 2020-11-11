/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.util.Scanner;
import java.util.logging.Level;
import static java.util.logging.Level.SEVERE;
import java.util.logging.Logger;

/**
 *
 * @author Kolombo
 */
public class Main {
    
    private void tast_1(){
        
        try{
            Reader r  = new FileReader("input.txt");
            Writer w = new FileWriter("output.txt");
            
            int c = r.read();
            boolean wasWhite = false;
            while(c != -1){
                if(Character.isWhitespace((char) c)){
                    if(!wasWhite){
                        w.write(' ');
                        wasWhite = true;
                    }
                } else {
                
                    w.write(c);
                    wasWhite = false;
                }
                c = r.read();
            }
            w.close();
            r.close();
            
            
        } catch(IOException ex){
            //Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex));
            //DONNO
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("fucking error");
        }
    }
    private void task_2(){
        try (
            BufferedReader br = new BufferedReader(new FileReader("input.txt"));
            BufferedWriter bw = new BufferedWriter(new FileWriter("output2.txt"));
        ){
            String s = br.readLine();
            int counter = 0;
            while(s != null){
                bw.write(Integer.toString(counter));
                bw.write(s);
                bw.newLine();
                s = br.readLine();
                counter++;
            }
        }
        catch(IOException ex){
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private void task_3(){
        File in = new File("input.txt");
        try(
                Scanner sc = new Scanner(in);
        ){
            int counter = 0;
            while(sc.hasNext()){
                sc.next();
                counter++;
            }
            System.out.println(counter);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Main m = new Main();
        m.tast_1();
        m.task_2();
        m.task_3();
    }
}
