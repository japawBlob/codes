package cz.cvut.fel.pjv.logging;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.logging.*;

/**
 * Bouncing Ball (Animation) via Swing Timer
 */
public class BouncingBall extends JFrame {
    // Define named-constants

    private static final int CANVAS_WIDTH = 300;
    private static final int CANVAS_HEIGHT = 300;
    private static final int UPDATE_PERIOD = 100; // milliseconds

    private final DrawCanvas canvas;  // the drawing canvas (extends JPanel)
    private final JToggleButton btnGravity, btnRun; // the toggle buttons
    private final Timer timer;

    // Attributes of moving object
    private int x = 150, y = 150;  // top-left (x, y)
    private final int size = 15;        // width and height
    private int xSpeed = 4, ySpeed = 5; // displacement per step in x, y
    private int gravity = 1;    // rate of ySpeed change
    private boolean gravityToggle = false;  // gravity toggle on/off


    // Our class logger
    private static final Logger LOG = Logger.getLogger(BouncingBall.class.getName());

    /**
     * Constructor to setup the GUI components
     */
    public BouncingBall() {
        // Set up the custom drawing canvas
        canvas = new DrawCanvas();
        canvas.setPreferredSize(new Dimension(CANVAS_WIDTH, CANVAS_HEIGHT));

        // Set up the buttons
        btnGravity = new JToggleButton("Gravity");
        btnGravity.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                gravityToggle = btnGravity.isSelected();
            }
        });
        btnRun = new JToggleButton("Run");
        btnRun.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if (btnRun.isSelected()) {
                    timer.start();
                } else {
                    timer.stop();
                }
            }
        });
        JButton btnQuit = new JButton("Quit");
        btnQuit.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
        });
        JPanel btnPanel = new JPanel(new FlowLayout());
        btnPanel.add(btnGravity);
        btnPanel.add(btnRun);
        btnPanel.add(btnQuit);

        // Set up the frame container
        Container cp = getContentPane();
        cp.setLayout(new BorderLayout());
        cp.add(canvas, BorderLayout.CENTER);
        cp.add(btnPanel, BorderLayout.SOUTH);

        this.setDefaultCloseOperation(EXIT_ON_CLOSE);
        this.pack();
        this.setLocationRelativeTo(null);
        this.setTitle("Bouncing Ball");
        this.setVisible(true);

        // Define an ActionListener to perform update at regular interval
        ActionListener updateTask = new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                update();   // update the (x, y) position
                repaint();  // Refresh the JFrame, callback paintComponent()
            }
        };
        // Allocate a Timer to run updateTask's actionPerformed() after every delay msec
        timer = new Timer(UPDATE_PERIOD, updateTask);

        // Configure own handlers
        LOG.setUseParentHandlers(false);
        Handler stdout = new StreamHandler(System.out, new SimpleFormatter()) {
            @Override
            public void publish(LogRecord record) {
                super.publish(record);
                flush();
            }
        };
        LOG.addHandler(stdout);
        LOG.setLevel(Level.ALL);
        stdout.setLevel(Level.ALL);

    }

    /**
     * Update the (x, y) position of the moving object
     */
    public void update() {
        x += xSpeed;
        y += ySpeed;
        if (x > CANVAS_WIDTH - size || x < 0) {
            xSpeed = -xSpeed;
        }
        if (y > CANVAS_HEIGHT - size || y < 0) {
            ySpeed = -ySpeed;
        }
        LOG.warning("y="+y+" " + ySpeed);
        if (gravityToggle) {
            ySpeed += gravity;
        }
    }

    /**
     * DrawCanvas (inner class) is a JPanel used for custom drawing
     */
    private class DrawCanvas extends JPanel {

        @Override
        public void paintComponent(Graphics g) {
            super.paintComponent(g);  // paint parent's background
            setBackground(Color.BLACK);
            g.setColor(Color.WHITE);
            g.fillOval(x, y, size, size);  // draw a circle
        }
    }

    public static void main(String[] args) {
        // Run GUI codes in Event-Dispatching thread for thread safety
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new BouncingBall(); // Let the constructor do the job
            }
        });

    }

}
