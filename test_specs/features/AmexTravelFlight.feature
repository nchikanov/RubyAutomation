Feature: AmexTravel Flight Booking

  Scenario Outline:
    Given I navigate to the external "<booking>" site
    When I click on the "<type of flight>" button
    And I fill in the "departure" field with "<starting point>" value
    Then I select "<airport>" option from the "first" dropdown menu
    And I fill in the "arrival" field with "<ending point>" value
    Then I select "<airport2>" option from the "second" dropdown menu
    Then I click on the "departure date" button
    And I select a date from the datepicker on the "<DepDate>" section
    Then  I select "<time>" option from the "dept time" dropdown menu
    And I click on the "return date" button
    Then I select a date from the datepicker on the "<RetDate>" section
    And I select "<time2>" option from the "ret time" dropdown menu
    #Question: If children are on board, there appear boxes based on how many there are.
    #What would be a good place to specify their ages since we don't know beforehand how many kids there are
    Then I click on the "number of travelers" button with "<seniors>", "<adults>", and "<children>"
    Then I click on the "nonstop flight" button
    And I select "<class type>" option from the "fare class" dropdown menu
    Then I click on the "search flights" button
    #So right now, the only way it'll fail is
    #if the website messes up, b/c then it won't find the correct xpath.
    #But is there another way to induce failure or to assert that it's not working?
    Then I verify that flight info from "<airport>" to "<airport2>" with "<seniors>", "<adults>", and "<children>" in "<class type>" is displayed

    # "starting point" "aiport" "ending point" and "airport2" must be airport abbreviations
    # options for "time" and "time2" = Anytime, 12am-9am, 6am-noon, 10am-2pm, noon-5pm, 4pm-8pm, 6pm-12am, 1am, 2am, 3am, 4am, 5am, 6am, 7am, 8am, 9am, 10am, 11am, Noon, 1pm, 2pm, 3pm, 4pm, 5pm, 6pm, 7pm, 8pm, 9pm, 10pm, 11pm, Midnight
    # may have 0-9 adults and seniors, and 0-8 children at a time
    # options for "class type" = Economy, Premium Economy, Business Class, First Class
    Examples:
    | booking | type of flight | starting point | airport | ending point | airport2 | DepDate | time     | RetDate | time2    | seniors | adults | children | class type       |
    | flights | round trip     | SFO            | SFO     | MSP          | MSP      | dep     | 4pm-8pm  | ret     | noon-5pm | 1       | 1      | 0        | Business Class   |
    #| flights | one way        |
    #| flights | multi city     |