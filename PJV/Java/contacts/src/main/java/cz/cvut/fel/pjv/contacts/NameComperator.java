/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.contacts;

import java.util.Comparator;

/**
 *
 * @author Kolombo
 */
public class NameComperator implements Comparator <Contact>{

    @Override
    public int compare(Contact o1, Contact o2) {
        return o1.getName().compareTo(o2.getName());
    }
    
}
