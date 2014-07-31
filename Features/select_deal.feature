Feature: Select a deal
  1. Visit the website and search for the German city “Hamburg”.
  2. Get the name of the second hotel of the result list.
  3. Have a look at all available deals and choose the third deal.
  4. Verify that the hotel name of the second hotel in our result list is available on the partners
  website (a partners website is the ﬁnal website after you had clicked on “View Deal”, e.g. from
  booking.com or Expedia).

  Scenario Outline: City suggestions are displayed when searching for a hotel
    Given I start typing city name "<term>"
    Then the list of city suggestions starts from "<city>" in "<country>"
  Examples:
    | term | city   | country |
    | ha   | Hawaii | USA     |
    | ham  | Hamburg| Germany |

  Scenario: Search for a hotel in a city with specified dates
    Given I search for a hotel in "Hamburg" city in "Germany"
    When I select dates of my stay
    Then the calendar of the search form is closed
    When I click search
    Then the hotel result list is displayed

  Scenario: Search for a hotel in a city with specified dates and select a deal
    Given I search for a hotel in "Hamburg" city in "Germany"
    And I select dates of my stay
    When I click search
    And I select the "2" hotel in the list
    When I select the "3" deal
    Then the hotel name is available on the partners website
