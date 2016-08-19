Feature: AmexTravel Car Booking

  Scenario Outline:
    Given I navigate to the external "cars" site
    When I set the radio buttons to "<type of rental>" and "<type of search>"
    And I set the "Where will you pick up the car" field with "<city or airport>" value

    Examples:
    | type of rental                    | type of search             | city or airport       |
    | Drop-off location same as pick-up | Search by city or airport  | San Francisco, CA, US |
