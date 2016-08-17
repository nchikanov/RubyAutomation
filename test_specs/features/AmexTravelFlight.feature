Feature: AmexTravel Flight Booking

  Scenario Outline: Book a nonstop flight for 1 adult, 2 children
    Given I navigate to the external "<booking>" site
    When I set the radio button to "<type of flight>"
    And I set the "Where are you going" fields with "<starting point>" value and "<ending point>" value
    And I select a date from the datepicker on the "<DepDate>" section
    And I select a date from the datepicker on the "<RetDate>" section
    And I set the "When are you going" fields with "<time>" value and "<time2>" value
    And I click on the "number of travelers" button with "<seniors>", "<adults>", and "<children>"
    #Question: Why did I have to do childrenage_combobox1 and 2...had to specify which box but you didn't?
    #Question: What is the point of "within"? Does this just restrict it to one block of code?
    #Question: Unrelated to Children -- ask about why you can't use @mainpage functions within @bookflightspage and vice versa. Any way to change to make them public to all?
    And I set the "Children Age" fields with "child in lap" value and "child in seat" value
    And I click on the "nonstop flight" button
    And I select "<class type>" option from the "fare class" dropdown menu
    And I click on the "search flights" button
    Then I verify that flight info from "<airport>" to "<airport2>" with "<seniors>", "<adults>", and "<children>" in "<class type>" is displayed

    # "starting point" "aiport" "ending point" and "airport2" must be airport abbreviations
    # options for "time" and "time2" = Anytime, 12am-9am, 6am-noon, 10am-2pm, noon-5pm, 4pm-8pm, 6pm-12am, 1am, 2am, 3am, 4am, 5am, 6am, 7am, 8am, 9am, 10am, 11am, Noon, 1pm, 2pm, 3pm, 4pm, 5pm, 6pm, 7pm, 8pm, 9pm, 10pm, 11pm, Midnight
    # options for "class type" = Economy, Premium Economy, Business Class, First Class
    Examples:
    | booking | type of flight | starting point | airport | ending point | airport2 | DepDate | time     | RetDate | time2    | seniors | adults | children | class type       |
    | flights | Round Trip     | SFO            | SFO     | MSP          | MSP      | dep     | 4pm-8pm  | ret     | noon-5pm | 0       | 1      | 2        | Economy          |
    #| flights | one way        |
    #| flights | multi city     |