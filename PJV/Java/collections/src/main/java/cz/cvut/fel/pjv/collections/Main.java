/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.collections;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author Kolombo
 */
public class Main {

    static class Person{
        private final int id;
        private final String name;

        public Person(int id, String name) {
            this.id = id;
            this.name = name;
        }

        @Override
        public String toString() {
            return "Person{" + "id=" + id + ", name=" + name + '}';
        }

        @Override
        public int hashCode() {
            int hash = 7;
            hash = 61 * hash + this.id;
            return hash;
        }

        @Override
        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null) {
                return false;
            }
            if (getClass() != obj.getClass()) {
                return false;
            }
            final Person other = (Person) obj;
            if (this.id != other.id) {
                return false;
            }
            return true;
        }
        
    }
    
    static class Book {
        private final String author;
        private final String title;

        public Book(String author, String title) {
            this.author = author;
            this.title = title;
        }

        @Override
        public String toString() {
            return "Book: " + author + title;
        }
        
        
    }
    
    public static void main(String[] args) {
        Person person1 = new Person(720217, "Josef Kos");
        Person person2 = new Person(720217, "Andrea Petrova");
        Person person3 = new Person(880703, "Vincent Chalupa");
       
        
        HashSet<Person> people = new HashSet<>();
        people.add(person1);
        people.add(person2);
        people.add(person3);
        
        System.out.println(people);
        
        
        Book book1 = new Book("Daniel Defoe", "Robinson Crusoe");
        Book book2 = new Book("Alois Jirasek", "F. L. Vek");
        Book book3 = new Book("Jules Verne", "Captain Nemo");
        
        Map<Integer, Book> library = new HashMap();
        
        library.put(123452, book1);
        library.put(123455, book2);
        library.put(123451, book3);
        
        for(Book book : library.values()){
            System.out.println(book);
        }
        System.out.println("--------------------");
        for(int isbn : library.keySet()){
            System.out.println(isbn);
        }
        System.out.println("--------------------");
        for(Map.Entry entry : library.entrySet()){
            System.out.println(entry);
        }
        
        System.out.println(library);
        
        Map<String, List<Integer>> mapOfArrays = new TreeMap<>();
        mapOfArrays.put("Prvni", new ArrayList<>(Arrays.asList(1,2,3,4,5)));
        mapOfArrays.put("Druhy", new ArrayList<>(Arrays.asList(4,5,9,9,9)));
    }
    
}
