Feature: Top 100 Torrents
  In order to know which movies are trending on The Pirate Bay
  As a pirate
  I want to view the Top 100 movies


  Scenario: Listing the Top 100 movie torrents
    Given the torrents have been updated
    When I go to the torrents list
    Then I should see the top movies listed
