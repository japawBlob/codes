/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.bikes;

/**
 *
 * @author Kolombo
 */
public class TestBikes {

    public static void main(String[] args) {
        Bicycle bike01, bike02, bike03;

        bike01 = new Bicycle(20, 10, 1, Color.BLUE);
        bike02 = new MountainBike(20, 10, 5, Color.GREEN, "Dual");
        bike03 = new RoadBike(40, 20, 8, Color.RED, 23);

        bike01.printDescription();
        bike02.printDescription();
        bike03.printDescription();
        
        BasicServise bs = new BasicServise();
        MountainBikeService mbs = new MountainBikeService();
        RoadBikeService rbs = new RoadBikeService();
        
        System.out.println("\nBasic service");
        bs.accept(bike01);
        bs.accept(bike02);
        bs.accept(bike03);
        
        System.out.println("\nMountain bike service");
        mbs.accept(bike01);
        mbs.accept(bike02);
        mbs.accept(bike03);
        
        System.out.println("\nRoad bike service");
        rbs.accept(bike01);
        rbs.accept(bike02);
        rbs.accept(bike03);
        
        System.out.println("\n...............DoubleDispatch...............");
        
        System.out.println("\nBasic service");
        bike01.visit(bs);
        bike02.visit(bs);
        bike03.visit(bs);
        
        System.out.println("\nMountain bike service");
        bike01.visit(mbs);
        bike02.visit(mbs);
        bike03.visit(mbs);
        
        System.out.println("\nRoad bike service");
        bike01.visit(rbs);
        bike02.visit(rbs);
        bike03.visit(rbs);
    }
    
}
