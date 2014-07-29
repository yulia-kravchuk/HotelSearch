Feature: Select deal
  Background:
    Given I open Trivago site

  Scenario Outline: City suggestions are displayed when searching for a hotel
    Given I start typing city name "<term>"
    Then the list of city suggestions starts from "<city>"
  Examples:
    | term | city   |
    | ha   | Hawaii |
    | ham  | Hamburg|


  Scenario: Search for a hotel in a city
    Given I search for a hotel in "Hamburg"
    And I select dates of my stay
    When I click search
    Then the hotel result list is displayed
    And the calendar of the search form is closed


  Scenario: Search for a hotel in a city and select a deal
    Given I search for a hotel in "Hamburg"
    And I select the "2" hotel in the list
    When I select the "3" deal
    Then the hotel name is available on the partners website
