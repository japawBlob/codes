/*
 * File name: Lab06.java
 * Date:      2014/08/26 21:39
 * Author:    @author
 */

package cz.cvut.fel.pjv;

import static cz.cvut.fel.pjv.TextIO.isDouble;
import java.util.Scanner;

public class Lab02 {


  
   public void start(String[] args) {
       if(args[0].equals('1') || args[0].equals('2') || args[0].equals('3') || args[0].equals('4')){ 
           System.exit(0);
       } else {
           TextIO input = new TextIO();
           homework(input);
       }
   }
   public void homework(TextIO input){
       String buff;
       double temporary;
       int numberCount = 0;
       int lineNumber = 0;
       double average = 0;
//       double standardDeveation;
       double[] numbers = new double[10];
       while(true){
           if((buff=input.getLine()).equals("")){
               System.err.println("End of input detected!");
               average = average/numberCount;
               double standardDeviation = 0;
               for(int i = 0; i<numberCount; i++){
                   numbers[i]-=average;
                   numbers[i]*=numbers[i];
                   standardDeviation += numbers[i];
               }
               standardDeviation = Math.sqrt(standardDeviation/(numberCount-1));
               
               System.out.printf("%2d %.3f %.3f", numberCount, average, standardDeviation);
               break;
           }
           if(isDouble(buff)){
               temporary = Double.parseDouble(buff);
               average += temporary;
               numbers[numberCount++] = temporary;
               lineNumber++;
           } else {
               System.err.printf("A number has not been parsed from line %d\n", lineNumber++);
           }
           if(numberCount == 10){
               average = average/10;
               double standardDeviation = 0;
               for(int i = 0; i<numberCount; i++){
                   numbers[i]-=average;
                   numbers[i]*=numbers[i];
                   standardDeviation += numbers[i];
               }
               standardDeviation = Math.sqrt(standardDeviation/(numberCount-1));
               
               System.out.printf("%2d %.3f %.3f", numberCount, average, standardDeviation);
               
               average = 0;
               numberCount = 0;
               
           }
       }
   }
}

/* end of Lab02.java */
