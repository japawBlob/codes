/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.cars.model;

import java.util.Objects;
import java.util.UUID;

/**
 *
 * @author Kolombo
 */
public class Car {
    
    private final String manufacturer;
    private final String modelName;
    private final int year;
    private final UUID vinCode;
    private final Engine engine; 
    private ServiceBook servicebook;
    private int speed;
    /**
     *
     */
    public static int carCount = 0;
    
    /**
     *
     * @param manufacturer
     * @param modelName
     * @param year
     * @param engineType
     */
    public Car(String manufacturer, String modelName, int year, String engineType) {
        this.manufacturer = manufacturer;
        this.modelName = modelName;
        this.year = year;
        this.engine = new Engine(engineType);
        vinCode = UUID.randomUUID();
        this.speed = speed;
        carCount++;  
    }

    /**
     *
     * @return
     */
    public String getManufacturer() {
        return manufacturer;
    }

    /**
     *
     * @return
     */
    public String getModelName() {
        return modelName;
    }

    /**
     *
     * @return
     */
    public ServiceBook getServiceBook() {
        return servicebook;
    }

    /**
     *
     * @param servicebook
     */
    public void setServiceBook(ServiceBook servicebook) {
        this.servicebook = servicebook;
    }
    
    @Override
    public String toString() {
        return manufacturer + " " + modelName + " year " + year + " VIN: " + vinCode;
    }
    
    /**
     *
     * @return
     */
    public static int getNumberOfExistingCars(){
        return carCount;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 23 * hash + Objects.hashCode(this.vinCode);
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
        final Car other = (Car) obj;
        if (!Objects.equals(this.vinCode, other.vinCode)) {
            return false;
        }
        return true;
    }
    
}
