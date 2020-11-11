/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.flappyfx;

import javafx.scene.paint.Color;

/**
 *
 * @author LaSer
 */
public class Util {

  static final String GFX_DIR = "/gfx/";

  static final double INIT_APP_WIDTH = 1024;
  static final double INIT_APP_HEIGHT = 768;
  static final double HORIZON_POS = INIT_APP_HEIGHT * 2 / 3;
  
  static final double PIXEL_SIZE = 5;

  // bird position
  static final double BIRD_INIT_X = 30;
  static final double BIRD_INIT_Y = INIT_APP_HEIGHT / 2;
  
  static final double GRAV_ACCELERATION = 0.06;
  static final double KEY_BOOST_ACCEL = 1.2;
  
  // pipe positions
  static final double INTER_PIPE_GAP = INIT_APP_HEIGHT / 3;
  static final double PIPE_MIN_VISIBLE_HEIGHT = INIT_APP_HEIGHT / 6;
  static final double PIPES_LEFT_INIT_X = INIT_APP_WIDTH * 1;
  static final double PIPES_RIGHT_INIT_X = INIT_APP_WIDTH * 1.5;

  static final double PIPE_ANIMATION_SPEED = PIXEL_SIZE;
  
  static final double TEXT_Y_POSITION = 100;
  
  // colors
  static final Color SKY_BLUE = Color.web("0x72c3cf");
  static final Color GROUND_BROWN = Color.web("0xddd894");
  static final Color BUTTON_ORANGE = Color.web("0xf9bf2c");
  static final Color BUTTON_RED = Color.web("0xfd674c");

  static final Color PIPE_DARK_GREEN = Color.web("0x538021");
  static final Color PIPE_GREEN = Color.web("0x66cc33");
  static final Color PIPE_LIGHT_GREEN = Color.web("0x9de759");
  static final Color PIPE_YELLOW = Color.web("0x9de759");
}
