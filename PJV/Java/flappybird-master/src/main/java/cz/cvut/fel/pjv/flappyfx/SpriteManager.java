/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.flappyfx;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author LaSer
 */
public class SpriteManager {
  private final Map<SpriteId, Sprite> sprites;
  
  public SpriteManager(Sprite... spriteList) {
    sprites = new HashMap<>();
    for (Sprite sprite : spriteList) {
      sprites.put(sprite.getId(), sprite);
    }
  }
  
  public Sprite[] getSprites() {
    return sprites.values().toArray(new Sprite[sprites.size()]);
  }
  
  public Sprite getSprite(SpriteId id) {
    return sprites.get(id);
  }
  
}
