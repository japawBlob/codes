package cz.cvut.fel.pjv.testing;

public class Calculator {

    public int add(int a, int b) {
        return a + b;
    }

    public int subtract(int a, int b) {
        return a - b;
    }

    public int multiply(int a, int b) {
        return a * b;
    }

    public int divide(int a, int b) {
        return a / b;
    }
    public double average(dataSource ds, int count){
        
        double average = 0;
        for (int i = 0; i < count; i++) {
            average+=ds.getSample();
        }
        return average/count;
    }
}
