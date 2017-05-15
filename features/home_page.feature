Feature: Viewer visit the home page
  In order to read the page
  As a Viewer
  I want to see the home page of my app

  Scenario: View home page
    Given I am on the home page
    Then I should see "This is the home page"

  Scenario: Find heading on the home page
    Given I am on the home page
    Then I should see "This is the home page" in the selector "h1"

  Scenario: Find the link on the home page
    Given I am on the home page
    Then I should see "List of the Tests" in the link