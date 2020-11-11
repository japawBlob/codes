/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cz.cvut.fel.pjv.testing;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Kolombo
 */
class MockDataSource implements dataSource{

    @Override
    public double getSample() {
        return 1;
    }
    
}

public class CalculatorTest {
    
    public CalculatorTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of add method, of class Calculator.
     */
    @Test
    public void testAdd() {
        System.out.println("add");
        int a = 10;
        int b = 5;
        Calculator instance = new Calculator();
        int expResult = 15;
        int result = instance.add(a, b);
        assertEquals(expResult, result);
    }

    /**
     * Test of subtract method, of class Calculator.
     */
    @Test
    public void testSubtract() {
        System.out.println("subtract");
        int a = 4;
        int b = 2;
        Calculator instance = new Calculator();
        int expResult = 2;
        int result = instance.subtract(a, b);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of multiply method, of class Calculator.
     */
    @Test
    public void testMultiply() {
        System.out.println("multiply");
        int a = 6;
        int b = 5;
        Calculator instance = new Calculator();
        int expResult = 30;
        int result = instance.multiply(a, b);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of divide method, of class Calculator.
     */
    @Test
    public void testDivide() {
        System.out.println("divide");
        int a = 75;
        int b = 25;
        Calculator instance = new Calculator();
        int expResult = 3;
        int result = instance.divide(a, b);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    @Test(expected = ArithmeticException.class)
    public void testDivideByZero() {
        System.out.println("divide");
        int a = 75;
        int b = 0;
        Calculator instance = new Calculator();
        instance.divide(a, b);
    }
    @Test
    public void testAverage(){
        System.out.println("average");
        int c = 10;
        Calculator instance = new Calculator();
        double expResult = 1;
        double result = instance.average(new MockDataSource(),c);
        assertEquals(expResult, result, 0.00001);
    }
    
}
