@wip
Feature: Searching
  Background:
    When I go to the home page
  
  Scenario: Searching for a Tune
    When I fill in "Explore Jazz:" with "Cherokee"
    And I press "Go"
    Then I should be on the tune "Cherokee"'s page
  
  Scenario: Searching for a Musician
    When I fill in "Explore Jazz:" with "Oscar Peterson"
    And I press "Go"
    Then I should be on the musician "Oscar Peterson"'s page
  
  Scenario: Searching for a Scale
    When I fill in "Explore Jazz:" with "Major"
    And I press "Go"
    Then I should be on the scale "Major"'s page
  
  Scenario: Searching for a Scale with Key Context
    When I fill in "Explore Jazz:" with "Eb Major"
    And I press "Go"
    Then I should be on the key "Eb"'s scale "Major"'s page
  
  Scenario: Searching for a Mode
    When I fill in "Explore Jazz:" with "Dorian"
    And I press "Go"
    Then I should be on the scale "Major"'s mode "Dorian"'s page
  
  Scenario: Searching for a Mode with Key Context
    When I fill in "Explore Jazz:" with "Eb Dorian"
    And I press "Go"
    Then I should be on the key "Eb"'s scale "Major"'s mode "Dorian"'s page
  
  Scenario: Searching for a Chord
    When I fill in "Explore Jazz:" with "maj7"
    And I press "Go"
    Then I should be on the chord "Major 7"'s page
  
  Scenario: Searching for a Chord with Key Context
    When I fill in "Explore Jazz:" with "Ebmaj7"
    And I press "Go"
    Then I should be on the key "Eb"'s chord "Major 7"'s page
  
  Scenario: Searching for a Voicing
    When I fill in "Explore Jazz:" with "So What"
    And I press "Go"
    Then I should be on the voicing "So What"'s page
  
  Scenario: Searching for a Voicing with Key Context
    When I fill in "Explore Jazz:" with "So What in Eb"
    And I press "Go"
    Then I should be on the key "Eb"'s voicing "So What"'s page
  
  Scenario: Searching for a Progression
    When I fill in "Explore Jazz:" with "Rhythm Changes"
    And I press "Go"
    Then I should be on the progression "Rhythm Changes"'s page
  
  Scenario: Searching for a Progression with Key Context
    When I fill in "Explore Jazz:" with "Rhythm Changes in Eb"
    And I press "Go"
    Then I should be on the key "Eb"'s progression "Rhythm Changes"'s page
  
  Scenario: Searching for a Jazz Concept
    When I fill in "Explore Jazz:" with "Tritone Substitution"
    And I press "Go"
    Then I should be on the concept "Tritone Substitution"'s page
  