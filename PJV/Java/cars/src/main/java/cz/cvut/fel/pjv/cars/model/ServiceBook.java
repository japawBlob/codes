/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.cars.model;

/**
 *
 * @author Kolombo
 */
public class ServiceBook {
    private final String [] serviceRecords = new String [30];
    private int recordCount = 0;
    private Car car;
    
    /**
     *
     * @param record
     */
    public void addRecord(String record){
        serviceRecords[recordCount] = record;
        recordCount++;
    }

    /**
     *
     * @param car
     */
    public ServiceBook(Car car) {
        this.car = car;
        
        this.car.setServiceBook(this);
    }
    

    @Override
    public String toString() {
        String ret = "";
        
        for(int i = 0; i<recordCount; i++){
            ret = ret + serviceRecords[i];
        }
        return ret;
    }
    
    

    

    
        
}
