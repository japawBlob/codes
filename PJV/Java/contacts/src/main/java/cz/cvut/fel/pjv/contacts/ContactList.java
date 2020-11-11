/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.contacts;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kolombo
 */
public class ContactList {
    List<Contact> contacts = new ArrayList<>();
    
    public void addContact(Contact contact){
        contacts.add(contact);
        
        //contacts.sort(null);
    }
    
    public void sortByAge(){
        contacts.sort(null);
    }
    public void sortByName(){
        contacts.sort(new NameComperator());
    }

    @Override
    public String toString() {
        String ret = "";
        
        for(Contact contact : contacts){
            ret += contact.toString() + "\n";
        }
        return "ContactList:" + ret;
    }
}