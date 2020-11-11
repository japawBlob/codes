/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kolombo
 */
public class Client {
    private static final String HOST = "127.0.0.1";
    private static final int PORT = 4444;
    private static final String[] messages = {
        "test for my client",
        "moje maminka je uzasna zena",
        "muj tatinek je nejsikovnejsi tatinek na svete"
    };
    
    public static void main(String[] args){
        try (
            Socket socket = new Socket(HOST, PORT);
            InputStream is = socket.getInputStream();
            //BufferedInputStream br = new BufferedInputStream(is);
            //InputStreamReader isr = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            OutputStream os = socket.getOutputStream();
            PrintWriter pw = new PrintWriter(os, true);
     
        ){
            for(String message : messages){
                System.out.println("about to send:  " + message);
                pw.println(message);
            }
            pw.println();
            
        } catch (IOException ex) {
            System.out.println("Can't open socket");
        }
    }
}
