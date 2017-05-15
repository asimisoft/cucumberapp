Feature: Test Form
  In order to save test data
  As a viewer i should be able to sumit test form

  Scenario: View test form page
    Given I am on "tests/new"
    Then I should see "Fill out the form"

  Scenario: Fill out the form
    Given I am on "tests/new"
    When I fill "test_name" with "Shiv raj"
    And I click "Save"
    Then I should see "This is the home page"