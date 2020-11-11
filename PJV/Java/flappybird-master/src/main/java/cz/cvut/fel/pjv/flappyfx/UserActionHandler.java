/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.flappyfx;

import java.util.Map;
import javafx.event.EventHandler;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;

import static cz.cvut.fel.pjv.flappyfx.Util.*;

/**
 *
 * @author LaSer
 */
public class UserActionHandler implements EventHandler<KeyEvent> {
  private final SpriteManager spriteManager;
  private final Map<String, Integer> gameVariables;
  private boolean keyIgnored; // prevent autorepeat

  public UserActionHandler(SpriteManager spriteManager, Map gameVariables) {
    this.spriteManager = spriteManager;
    this.gameVariables = gameVariables;
  }

  @Override
  public void handle(KeyEvent event) {
    if (event.getEventType() == KeyEvent.KEY_PRESSED && !keyIgnored) {
      if (event.getCode() == KeyCode.UP) {
        Bird bird = (Bird)spriteManager.getSprite(SpriteId.BIRD);
        bird.increaseSpeedY(-Util.KEY_BOOST_ACCEL);
        keyIgnored = true;
      } else if (event.getCode() == KeyCode.SPACE) {
        if (gameVariables.get("Playing") == 1) {
          // end current game
          gameVariables.put("Playing", 0);
        } else {
          // start a new game
          gameVariables.put("Score", 0);
          gameVariables.put("Playing", 1);
          Bird bird = (Bird)spriteManager.getSprite(SpriteId.BIRD);
          bird.setPosition(BIRD_INIT_X, BIRD_INIT_Y);
          bird.setSpeedY(0);
        }
      }
    } else if (event.getEventType() == KeyEvent.KEY_RELEASED && keyIgnored) {
        keyIgnored = false;
    }
  }
}
