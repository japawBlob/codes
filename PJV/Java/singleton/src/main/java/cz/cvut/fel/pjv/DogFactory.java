/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv;

class Husky implements Dog{
    @Override 
    public void bark(){
        System.out.println("HoWGH");
    }
}

class Rotweiler implements Dog{
    @Override 
    public void bark(){
        System.out.println("Grrrrr");
    }
}

class Terrier implements Dog{
    @Override 
    public void bark(){
        System.out.println("Yaipeee");
    }
}
public class DogFactory {
    public Dog createDog (String size){
        if (size.equals("large")){
            return new Husky();
        } else if (size.equals("medium")){
            return new Rotweiler();
        } else if (size.equals("small")){
            return new Terrier();
        }
        return null;
    }
}
