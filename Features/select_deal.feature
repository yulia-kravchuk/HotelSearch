Feature: Select deal
  1. Visit the website and search for the German city “Hamburg”.
  2. Get the name of the second hotel of the result list.
  3. Have a look at all available deals and choose the third deal.
  4. Verify that the hotel name of the second hotel in our result list is available on the partners
  website (a partners website is the ﬁnal website after you had clicked on “View Deal”, e.g. from
  booking.com or Expedia).

  Background:
    Given I open Trivago site

  Scenario Outline: City suggestions are displayed when searching for a hotel
    Given I start typing city name "<term>"
    Then the list of city suggestions starts from "<city>"
  Examples:
    | term | city   |
    | ha   | Hawaii |
    | ham  | Hamburg|


#  Scenario: Search for a hotel in a city
#    Given I search for a hotel in "Hamburg"
#    And I select dates of my stay
#    When I click search
#    Then the hotel result list is displayed
#    And the calendar of the search form is closed
#
#
#  Scenario: Search for a hotel in a city and select a deal
#    Given I search for a hotel in "Hamburg"
#    And I select the "2" hotel in the list
#    When I select the "3" deal
#    Then the hotel name is available on the partners website
