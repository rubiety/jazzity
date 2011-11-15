@wip
Feature: Home Page
  
  Scenario: Viewing Home Navigation
    When I go to the home page
    Then I should see "Home" within the header links
    And I should see "Tunes" within the header links
    And I should see "Musicians" within the header links
    And I should see "Scales/ & Modes" within the header links
    And I should see "Chords & Voicings" within the header links
    And I should see "Progressions & Form" within the header links
    And I should see "Jazz Concepts" within the header links
  
  Scenario: Viewing Home Search Section
    When I go to the home page
    Then I should see "Explore Jazz" within the search section
    And I should see the search box
    And I should see example searches
  
  Scenario: Viewing Home Page About
    When I go to the home page
    Then I should see "What is Jazzity?" in the about section
  
  Scenario: Viewing Recent Activity
    When I go to the home page
    Then I should see "Recent Activity" in the recent activity section
    