/**
* Simple drawing canvas implementation in JavaFX
* Created for B0B36PJV in b182
* 
* Implement your drawing algorithm here
*
* @author  ladislav.seredi@fel.cvut.cz
* @version 1.0
* @since   2019-02-16 
*/
package cz.cvut.fel.pjv;

public class UserDraw {
  
  static final int WIDTH = 300;  // pixels
  static final int HEIGHT = 300; // dtto
  private final Main app;

  public UserDraw(Main app) {
    this.app = app;
  }

  boolean isPrime(int num) {
    // DEBUG: random
    // return Math.random() < 0.5;
    int max = (int)Math.sqrt(num);
    for (int i = 2; i <= max; ++i) {
      if (num % i == 0) {
        return false;
      }
    }
    return true;
  }
  
  void plot(int num, int x, int y) {
    // DEBUG: System.out.println(x + " " + y);
    if (isPrime(num)) {
      app.drawPoint(x, y, 0xFFFF0000);
    }
  }
  
  void drawSpiral() {
    int levels = WIDTH / 2;
    int x = WIDTH / 2;
    int y = HEIGHT / 2;
    int n = 0;
    plot(n++, x, y);
    for (int t = 1; t < WIDTH / 2 -1 ; ++t) {
      y++;
      plot(n++, x, y);
      for (int i = 1; i <= 2 * t - 1; ++i) {
        plot(n++, ++x, y);
      }
      for (int i = 1; i <= 2 * t; ++i) {
        plot(n++, x, --y);
      }
      for (int i = 1; i <= 2 * t; ++i) {
        plot(n++, --x, y);
      }
      for (int i = 1; i <= 2 * t; ++i) {
        plot(n++, x, ++y);
      }
    }
  }

  public void start() {
    app.initCanvas(WIDTH, HEIGHT);
    drawSpiral();
  }
}
