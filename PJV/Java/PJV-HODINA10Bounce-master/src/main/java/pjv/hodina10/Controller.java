/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pjv.hodina10;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kolombo
 */
public class Controller implements Runnable{
    private final Model model;

    public Controller(Model model) {
        this.model = model;
        new Thread(this).start();
    }

    @Override
    public void run() {
        while(true){
            try {
                Thread.sleep(50);
            } catch (InterruptedException ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            //model.setxPosition(model.getxPosition()+model.getxVelocity());
            //model.setyPosition(model.getyPosition()+model.getyVelocity());
            if(model.getxPosition() < 0 || model.getxPosition() > model.getPlaygroudWidht() - 2*model.getRadius()){
                model.setxVelocity(-model.getxVelocity());
            }
            if(model.getyPosition() < 0 || model.getyPosition() > model.getPlaygroudWidht() - 2*model.getRadius()){
                model.setyVelocity(-model.getyVelocity());
            }
            model.setxyPosition(model.getxPosition()+model.getxVelocity(),model.getyPosition() + model.getyVelocity());
            
        }
    }
    
    
    
}
