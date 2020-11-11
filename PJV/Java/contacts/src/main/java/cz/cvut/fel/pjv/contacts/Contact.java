/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.contacts;

/**
 *
 * @author Kolombo
 */
public class Contact  implements Comparable<Contact>{
    private final String surname;
    private final String name;
    private final int age;

    public Contact(String surname, String name, int age) throws IncorrectInputDataException{
        this.surname = checkName(surname);
        this.name = checkName(name);
        this.age = checkAge(age);
    }
    
    private int checkAge(int age) throws IncorrectInputDataException{
        if(age<0 || age>150)
            throw new IncorrectInputDataException("Invalid age " + age);
        return age;
    }
    
    private String checkName(String name) throws IncorrectInputDataException{
        if(!name.matches("[a-zA-Z]+"))
            throw new IncorrectInputDataException("Invalid name " + name);
        return name;
    }

    @Override
    public String toString() {
        return "surname=" + surname + ", name=" + name + ", age=" + age;
    }

    @Override
    public int compareTo(Contact o) {
        return age - o.age;
    }

    public String getName() {
        return name;
    }
    
    
    
}
