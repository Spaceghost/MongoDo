Feature: Add TODO List
  As a user, I want to be able to create lists so that I can keep track of what I should be doing.

  Scenario: Successfully create TODO List
    Given I am on the home page
    When I click the "New List" button
    And fill out the list details
    Then my new list should be created
    And I should be on the show page for my list
