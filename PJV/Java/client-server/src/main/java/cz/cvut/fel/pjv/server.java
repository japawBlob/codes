/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Kolombo
 */
class ClientService{
    private final Socket socket;
    
    ClientService(Socket socket){
        this.socket = socket;
    }
    
    public void run(){
        try (
            InputStream is = socket.getInputStream();
            //BufferedInputStream br = new BufferedInputStream(is);
            //InputStreamReader isr = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            OutputStream os = socket.getOutputStream();
            PrintWriter pw = new PrintWriter(os, true);
        ){
            System.out.println("Waiting for first message...");
            String message = br.readLine();
            while(!message.equals("bye")){
                System.out.println("Message recivied " + message);
                pw.println(message);
                message = br.readLine();
            }
            System.out.println("END FLAG RECIVIED");
            
        } catch (IOException ex) {
            System.out.println("Problem with socket");
        }
    }
}



public class server {
    private static final int PORT = 4444;

    public static void main(String[] args) {
        try (
            ServerSocket serverSocket = new ServerSocket(PORT);
            
        ){
            while(true){
               new ClientService(serverSocket.accept()).run(); 
            }
        } catch (IOException ex) {
            System.out.println("Cant get port " + PORT);
        }

    }
}
