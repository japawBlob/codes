/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.flappyfx;

import javafx.event.Event;
import javafx.event.EventHandler;
import javafx.geometry.Rectangle2D;
import java.util.Map;

import static cz.cvut.fel.pjv.flappyfx.Util.*;  // import static constants

/**
 *
 * @author LaSer
 */
public class GameLoopHandler implements EventHandler {
  private final GameCanvas gameCanvas;
  private final SpriteManager spriteManager;
  private final Map<String, Integer> gameVariables;

  public GameLoopHandler(
    GameCanvas gameCanvas,
    SpriteManager spriteManager,
    Map gameVariables) {

    this.gameCanvas = gameCanvas;
    this.spriteManager = spriteManager;
    this.gameVariables = gameVariables;
    gameVariables.put("Score", 0);
    gameVariables.put("Playing", 0);
    initSprites();
  }

  private void initSprites() {
    double topPipeHeightLeft = Pipe.randomTopPipeHeight();
    double topPipeHeightRight = Pipe.randomTopPipeHeight();
    for (Sprite sprite : spriteManager.getSprites()) {
      switch (sprite.id) {
        case BIRD:
          sprite.setPosition(BIRD_INIT_X, BIRD_INIT_Y);
          ((Bird)sprite).setSpeedY(0);
          break;
        case PIPE_TOPLEFT:
          sprite.setHeight(topPipeHeightLeft);
          sprite.setPosition(PIPES_LEFT_INIT_X, 0);
          break;
        case PIPE_BOTTOMLEFT:
          sprite.setHeight(INIT_APP_HEIGHT - topPipeHeightLeft - INTER_PIPE_GAP);
          sprite.setPosition(PIPES_LEFT_INIT_X, topPipeHeightLeft + INTER_PIPE_GAP);
          break;
        case PIPE_TOPRIGHT:
          sprite.setHeight(topPipeHeightRight);
          sprite.setPosition(PIPES_RIGHT_INIT_X,0);
          break;
        case PIPE_BOTTOMRIGHT:
          sprite.setHeight(INIT_APP_HEIGHT - topPipeHeightRight - INTER_PIPE_GAP);
          sprite.setPosition(PIPES_RIGHT_INIT_X, topPipeHeightRight + INTER_PIPE_GAP);
          break;
      }
    }
    gameCanvas.redraw();
  }


  private void updatePipes(Pipe topPipe, Pipe bottomPipe) {
    if (topPipe.getX() + topPipe.getWidth()< 0) {
      double topPipeHeight = Pipe.randomTopPipeHeight();
        topPipe.setHeight(topPipeHeight);
        topPipe.setPosition(INIT_APP_WIDTH, 0);
        bottomPipe.setHeight(INIT_APP_HEIGHT - topPipeHeight - INTER_PIPE_GAP);
        bottomPipe.setPosition(PIPES_LEFT_INIT_X, topPipeHeight + INTER_PIPE_GAP);
    } else {
      topPipe.increaseX(-PIPE_ANIMATION_SPEED);
      bottomPipe.increaseX(-PIPE_ANIMATION_SPEED);
    }
  }
  
  private void updateSprites() {
    // update bird position
    Bird bird = (Bird)spriteManager.getSprite(SpriteId.BIRD);
    double birdY = bird.getY();
    bird.setY(birdY + bird.getSpeedY());
    bird.increaseSpeedY(GRAV_ACCELERATION);

    // update pipe positions
    Pipe topPipe = (Pipe)spriteManager.getSprite(SpriteId.PIPE_TOPLEFT);
    Pipe bottomPipe = (Pipe)spriteManager.getSprite(SpriteId.PIPE_BOTTOMLEFT);
    updatePipes(topPipe, bottomPipe);
    topPipe = (Pipe)spriteManager.getSprite(SpriteId.PIPE_TOPRIGHT);
    bottomPipe = (Pipe)spriteManager.getSprite(SpriteId.PIPE_BOTTOMRIGHT);
    updatePipes(topPipe, bottomPipe);

    gameCanvas.redraw();
  }

  private void checkCollisions() {
    Bird bird = (Bird)spriteManager.getSprite(SpriteId.BIRD);
    double birdY = bird.getY();

    // top or bottom crash
    if (birdY <= 0 || birdY >= INIT_APP_HEIGHT - bird.getHeight()) {
      restartGame();
    }

    // check collision with pipe
    Rectangle2D birdBounds = bird.getBounds();
    for (SpriteId id : SpriteId.values()) {
      if (id != SpriteId.BIRD) {
        if (spriteManager.getSprite(id).getBounds().intersects(birdBounds)) {
          restartGame();
        }
      }
    }
  }

  private void restartGame() {
    gameVariables.put("Score", gameVariables.get("Score") + 1);
    System.out.println(gameVariables.get("Score"));
    initSprites();
  }
  
  private void cleanupSprites() {
    // remove dead bodies, etc... TBD
  }
  
  @Override
  public void handle(Event event) {
    updateSprites();
    if (gameVariables.get("Playing") == 1) {
      checkCollisions();
    }
    cleanupSprites();
  }
  
}
