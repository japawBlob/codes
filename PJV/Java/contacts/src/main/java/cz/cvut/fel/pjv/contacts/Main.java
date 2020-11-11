/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.contacts;

import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kolombo
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ContactList contacts = new ContactList();
        
        
        Scanner sc = new Scanner(System.in);
        String answer;
        do{
            Contact c;
            System.out.println("Enter surname");
            String surname = sc.next();
            System.out.println("Enter name");
            String name = sc.next();
            System.out.println("Enter age");

            try {
                int age = sc.nextInt();
                c = new Contact(surname, name, age);
                contacts.addContact(c);
            } catch (IncorrectInputDataException ex) {
                System.out.println(ex.getMessage());
            } catch (InputMismatchException e){
                System.out.println("Vek musi byt cislo");
            }


            System.out.println("Do you want to add another contact? [Y/N]");
            answer = sc.next();
        } while(answer.equals("Y") || answer.equals("y"));
        
        System.out.println(contacts);
        contacts.sortByAge();
        System.out.println(contacts);
    }
    
}
