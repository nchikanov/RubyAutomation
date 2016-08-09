#create feature that will open Google instead of Spigit
  #Can reuse what have. Navigate, text fields, etc.

Feature: Google Search

  Scenario Outline: Verify that search engine is working
    Given I navigate to the external "<search_engine>" site
    When I fill in the "search" field with "<some>" value
    And I click on the "search" button
    Then I verify the "<result_nina>" page is displayed

    Examples:
  | search_engine     | some           | result_nina |
  | google            | puppies        | puppies     |
  | bing              | ice cream      | ice cream   |
  #| duckduckgo        | cookies        | cookies     |
