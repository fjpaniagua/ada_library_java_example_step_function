# Acceptance Tests for Java projects

An acceptance test is a formal description of the behavior of a software product, generally expressed as an example or
a usage scenario. The AT acts as a verification of the required business function and proper functioning of the system,
emulating real-world usage conditions on behalf of customers.

`testAT` module contains the source code and files for acceptance testing and defines the way other components are
available for that purpose.


* Acceptance tests resource files: this directory contains files used as resources in acceptance tests, such as
  feature files, data, process configuration.
* Acceptance Test Runner: `RunCucumberTest.java` file is the one that performs the test execution.
* Custom steps: it is possible that a particular project might need to extend this and implement its own steps.


Resource files for acceptance tests should be defined in the following subfolders:

* `src/test/resources/features`: here we define our test files using Gherkin language.
* `src/test/java/com/bbva/test/ada_library_java_example_step_function/at/StepDefinitions.java`: here we write the code of the different steps of the feature.
* `src/test/java/com/bbva/test/ada_library_java_example_step_function/at/RunCucumberTest.java`: here we indicate which feature we want to execute. By default it will execute all features.


It contains the definition of our acceptance tests in Gherkin language. For now, some considerations are needed to
make it work:
* Tags: Cucumber tags (`@tag`) can be used in the feature file in order to organize and launch specific scenarios.

# Useful links

* [Cucumber](https://cucumber.io/)
* [Gherkin](https://docs.cucumber.io/gherkin/reference/)
