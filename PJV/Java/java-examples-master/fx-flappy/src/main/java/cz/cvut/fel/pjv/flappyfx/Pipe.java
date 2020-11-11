/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.flappyfx;

import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;

import static cz.cvut.fel.pjv.flappyfx.Util.*;

/**
 *
 * @author LaSer
 */
public class Pipe extends Sprite {
  PipeLoc location;
  Canvas canvas;
  double headHeight;

  static double randomTopPipeHeight() {
    return Math.round(PIPE_MIN_VISIBLE_HEIGHT + Math.random() * (INIT_APP_HEIGHT - 2 * PIPE_MIN_VISIBLE_HEIGHT - INTER_PIPE_GAP));
	}
  
  
  public Pipe(SpriteId id, String imageName, PipeLoc location) {
    super(id, imageName);
    canvas = new Canvas(width, height);
    this.headHeight = height;
    this.location = location;
  }

  @Override
  public void render(GraphicsContext gc) {
    drawStripes(gc);
    double top = location == PipeLoc.TOP ? y + height - headHeight : y;
    if (location == PipeLoc.TOP) {
      gc.drawImage(image, x, top);
    } else {
      gc.drawImage(image, 0, 0, width, headHeight, x, top + headHeight, width, -headHeight);
    }
  }

  @Override
  public void setHeight(double height) {
    this.height = height;
  }
  
  private void drawStripes(GraphicsContext gc) {
    drawStripe(gc, 1, 1, Color.BLACK);
    drawStripe(gc, 2, 1, PIPE_LIGHT_GREEN);
    drawStripe(gc, 3, 1, PIPE_YELLOW);
    drawStripe(gc, 4, 3, PIPE_LIGHT_GREEN);
    drawStripe(gc, 7, 1, PIPE_GREEN);
    drawStripe(gc, 8, 1, PIPE_LIGHT_GREEN);
    drawStripe(gc, 9, 15, PIPE_GREEN);
    drawStripe(gc, 24, 1, PIPE_DARK_GREEN);
    drawStripe(gc, 25, 1, PIPE_GREEN);
    drawStripe(gc, 26, 2, PIPE_DARK_GREEN);
    drawStripe(gc, 28, 1, Color.BLACK);
  }
  
  private void drawStripe(GraphicsContext gc, double x, double width, Color color) {
    double top = location == PipeLoc.TOP ? y : y + headHeight;
    gc.setFill(color);
    gc.fillRect(this.x + PIXEL_SIZE * x, top, PIXEL_SIZE * width, height - headHeight);
  }  
}
