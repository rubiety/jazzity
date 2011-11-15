@wip
Feature: Musicians
  
  Scenario: Viewing a Musicians Listing
    When I go to the musicians page
  
  Scenario: Searching for a Musician
    When I go to the musicians page
    And I fill in "Query" with "Oscar Peterson"
    And I press "Go"
  
  Scenario: Viewing a Musician
    When I go to the musician "Oscar Peterson"'s page
