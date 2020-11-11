/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.testing;

import java.util.Random;

/**
 *
 * @author Kolombo
 */
public class RandomDataSource implements dataSource{
    Random rnd = new Random();
    
    public double getSample(){
        return rnd.nextDouble();
    }
}
