package com.bbva.test.ada_library_java_example_step_function;


/**
 * Sample class for Java
 */
public class Sample {

    private static final String HELLO_MESSAGE = "Hello world!";

    /**
     * Prints a sample text
     *
     * @return sample text printed
     */
    public String hello() {
        return HELLO_MESSAGE;
    }

    /**
     * Adds the two numbers given in parameters
     *
     * @param a first numer to add
     * @param b second numer to add
     * @return sum of both numbers
     */
    public int add(int a, int b) {
        return a + b;
    }
}
