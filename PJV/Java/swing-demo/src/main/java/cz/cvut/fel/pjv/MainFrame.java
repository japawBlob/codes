/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;

/**
 *
 * @author Kolombo
 */
public class MainFrame extends javax.swing.JFrame {

    public MainFrame() {
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setTitle("Moje první Swing aplikace");
        setSize(800, 600);
        setVisible(true);
        
        Container cp = getContentPane();
        cp.setLayout(new FlowLayout());
        JTextField input = new JTextField("Poloměr");
        JButton button = new JButton("Spočítej!");
        JLabel label = new JLabel("Obvod");
        cp.add(input);
        cp.add(button);
        cp.add(label);
        
        
        button.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent evt) {
                double polomer = Double.parseDouble(input.getText());
                double obvod = 2 * Math.PI * polomer; 
                label.setText(String.valueOf(obvod));
            }
          });
    }

    
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable(){
            @Override
            public void run(){
                new MainFrame().setVisible(true);
            }
        });
    }
    
}
