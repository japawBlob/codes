/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.data;

/**
 *
 * @author Kolombo
 */
public class TimeSpan {
    private int hour;
    private int minute;
    private int second;
    
    private final int MAX_minutes_second = 60;

    public TimeSpan() {
    }

    public TimeSpan(int second) {
        this.second = hour;
        normalizeTime();
    }

    public TimeSpan(int second, int minute) {
        this.second = hour;
        this.minute = minute;
        normalizeTime();
    }

    public TimeSpan(int hour, int minute, int second) {
        this.hour = hour;
        this.minute = minute;
        this.second = second;
        normalizeTime();
    }
    
    public TimeSpan(TimeSpan timeSpan) {
        this.hour = timeSpan.hour;
        this.minute = timeSpan.minute;
        this.second = timeSpan.second;
    }
    
    public void setTime(int hour, int minute, int second) {
        this.hour = hour;
        this.minute = minute;
        this.second = second;
    }
    
    public int checkOverflow(int minsec){
        if(minsec > MAX_minutes_second - 1){
            return 0;
        }
        return minsec;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 53 * hash + this.hour;
        hash = 53 * hash + this.minute;
        hash = 53 * hash + this.second;
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
        final TimeSpan other = (TimeSpan) obj;
        if (this.hour != other.hour) {
            return false;
        }
        if (this.minute != other.minute) {
            return false;
        }
        if (this.second != other.second) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return hour + " hours " + minute + "minutes" + second + "seconds";
    }
    
    public int getTotalSecond(){
        return ((MAX_minutes_second*hour + minute)*MAX_minutes_second) + second;
    }
    
    
    
    public TimeSpan add(int second){
        this.second += second;
        normalizeTime();
        return this;
    }
    
    private void normalizeTime(){
        if(second >= MAX_minutes_second){
            minute += second / MAX_minutes_second;
            second = second % MAX_minutes_second;
        }
        if(minute >= MAX_minutes_second){
            hour += minute / MAX_minutes_second;
            minute = minute % MAX_minutes_second;
        }
    }
    
}
