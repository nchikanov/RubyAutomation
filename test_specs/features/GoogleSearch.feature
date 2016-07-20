#create feature that will open Google instead of Spigit
  #Can reuse what have. Navigate, text fields, etc.

Feature: Google Search

  Scenario Outline: Verify that search engine is working
    Given I navigate to the external "<search_engine>" site
    When I fill in the "search" field with "<some>" value
    And I click on the "search" button
    Then I verify the "<result_nina>" page is displayed

    #Then I verify that when I search for "<some>" value, "<search_engine>" site returns related results

    #Note: Having some issues w/ the "then" statement above ^ have questions in notepad about how to write
    #Note: For <search_engine> I tried to make a getUrl function in @communities using similar layout at getCommunityUrl,
    #but it was not loading the page when I ran the tests, so I stuck to hard-coding the URLs. Is this fine or should
    #I make a new function?

    Examples:
  | search_engine     | some      | result_nina |
  | google            | puppies   | puppies     |
  #| bing              | ice cream | ice cream   |
  #| duckduckgo        | cookies   | cookies     |
