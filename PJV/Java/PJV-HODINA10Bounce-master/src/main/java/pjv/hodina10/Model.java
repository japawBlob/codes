
package pjv.hodina10;

import java.util.Observable;
import java.util.Observer;

public class Model extends Observable {    
    
    private int xPosition, yPosition, radius = 50;
    private int xVelocity = 3, yVelocity = 8; 
    private int playgroudWidht = 500, playgroundHeight = 500;
    
    
    public Model() {        
        
    }

    public int getPlaygroudWidht() {
        return playgroudWidht;
    }

    public int getPlaygroundHeight() {
        return playgroundHeight;
    }

    
    
    public int getxVelocity() {
        return xVelocity;
    }

    public int getyVelocity() {
        return yVelocity;
    }
    
    /**
     * @return the xPosition
     */
    public int getxPosition() {
        return xPosition;
    }

    /**
     * @param xPosition the xPosition to set
     */
    public void setxyPosition(int xPosition, int yPosition) {
        setChanged();
        this.xPosition = xPosition;
        this.yPosition = yPosition;
        notifyObservers();
    }
    
    public void setxPosition(int xPosition) {
        setChanged();
        this.xPosition = xPosition;
        notifyObservers();
    }

    public void setxVelocity(int xVelocity) {
        this.xVelocity = xVelocity;
    }

    public void setyVelocity(int yVelocity) {
        this.yVelocity = yVelocity;
    }
    
    /**
     * @return the yPosition
     */
    public int getyPosition() {
        return yPosition;
    }

    /**
     * @param yPosition the yPosition to set
     */
    public void setyPosition(int yPosition) {
        setChanged();
        this.yPosition = yPosition;
        notifyObservers();
    }

    /**
     * @return the radius
     */
    public int getRadius() {
        return radius;
    }

    /**
     * @param radius the radius to set
     */
    public void setRadius(int radius) {
        setChanged();
        this.radius = radius;
        notifyObservers();
    }
}
