
package pjv.hodina10;


import java.awt.Canvas;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.GridLayout;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.Observable;
import java.util.Observer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;


public class View extends Canvas implements Observer, Runnable{

    private Model model;
    private JFrame mainFrame;    
    private volatile boolean  needUpdate;
    
    public View(Model model){
        this.model = model;
        new Thread(this).start();
    }
    
   
    
    
    @Override
    public void update(Observable o, Object arg) {
        needUpdate = true;        
    }

    @Override
    public void run() {
        mainFrame = new JFrame("bounce");
        mainFrame.setSize(model.getPlaygroudWidht(), model.getPlaygroundHeight());        
        mainFrame.addWindowListener(new WindowAdapter() {
        public void windowClosing(WindowEvent windowEvent){
            System.exit(0);
        }        
      });
        
       mainFrame.setLayout(new GridLayout(1, 1));      
       mainFrame.add(this);       
       mainFrame.setVisible(true);
       
       
       
        while (true) {
            if(needUpdate){
                needUpdate = false;
                repaint();
                try {
                    Thread.sleep(50);
                } catch (InterruptedException ex) {
                    Logger.getLogger(View.class.getName()).log(Level.SEVERE, null, ex);
                    break;
                }
            }            
        }       
    }

    @Override
    public void paint(Graphics g) {
       
        synchronized(model){
            g.setColor(Color.red);
            g.fillOval(model.getxPosition(), model.getyPosition(), model.getRadius(), model.getRadius());
        }
    }
    
    
    
}
