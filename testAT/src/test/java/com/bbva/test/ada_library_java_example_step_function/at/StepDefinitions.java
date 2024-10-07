package com.bbva.test.ada_library_java_example_step_function.at;

import com.bbva.test.ada_library_java_example_step_function.Sample;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class StepDefinitions {
    Sample example = new Sample();
    String resultTest1 = null;
    Integer resultTest2 = null;

    @Given("Hello method is called")
    public void helloMethodIsCalled() {
        resultTest1 = example.hello();
    }

    @When("Add method is called with {} and {}")
    public void addMethodIsCalledWith(int a, int b) {
        resultTest2 = example.add(a, b);
    }

    @Then("It should print the correct greeting message")
    public void itShouldPrintTheCorrectGreetingMessage() {
        assertEquals(resultTest1, "Hello world!");
    }

    @Then("It should return the sum of the two numbers which is {}")
    public void itShouldReturnTheSumOfTheTwoNumbersWhichIs(int expectedResult) {
        assertEquals(8, expectedResult);
    }
}
