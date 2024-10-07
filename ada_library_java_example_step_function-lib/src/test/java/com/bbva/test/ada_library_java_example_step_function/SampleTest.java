package com.bbva.test.ada_library_java_example_step_function;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

/**
 * Test suite for Sample class
 */
public class SampleTest {

    /**
     * helloTest
     */
    @Test
    public void helloTest() {
        Sample example = new Sample();
        String resultTest = example.hello();
        assertEquals("Hello world!", resultTest);
    }

    /**
     * addTest
     */
    @Test
    public void addTest() {
        Sample example = new Sample();
        int resultTest = example.add(3, 8);
        assertEquals(11, resultTest);
    }
}
