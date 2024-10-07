Feature: An example

  Scenario: Greeting correctly
    When Hello method is called
    Then  It should print the correct greeting message

  Scenario: Correctly add two numbers
    When Add method is called with 5 and 3
    Then  It should return the sum of the two numbers which is 8
