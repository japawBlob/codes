/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;

class Employee implements Serializable {
    private final String jmeno;
    private final String funkce;
    private final String telefon;
    private final String email;
    //private boolean dummy;

    public Employee(String[] records) {
        this.jmeno = records[0];
        this.funkce = records[1];
        this.telefon = records[4];
        this.email = records[6];
    }
    
    
}

public class Main {

    public static void main(String[] args) {
        try (
            BufferedReader br = new BufferedReader(new FileReader("tel_seznam_KUp_2.csv"));
            ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("output.txt"));
        ){
            String line = br.readLine();
            
            HashSet<Employee> employees = new HashSet();
            
            while(line != null){
                /*
                String s = "";
                for (String string : line.split(";")) {
                    Employee  employee = new Employee(line, line, line, string);
                }
                System.out.println(s);
                s = "";
                */
                String[] records = line.split(";");
                Employee  employee = new Employee(records);
                employees.add(employee);
                line = br.readLine();
            }
            oos.writeObject(employees);
        }
        catch(IOException ex){
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try (
            ObjectInputStream ois = new ObjectInputStream(new FileInputStream("output.txt"));
        ){
            
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
    
    
    

