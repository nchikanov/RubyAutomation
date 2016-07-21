Feature: Social Media Login

  Scenario Outline: Verify that user logs in and landing page loads
    Given I navigate to the external "<web>" site
    When I login with the given "<user>"
    Then I verify the "<landing>" page is displayed

    #Start using more than one argument for each step
    #Sign Up for Facebook, create two or 3 fake email accounts that will work
    #Go to email accounts and see if confirmation email is there
    #Need: Gmail gems
    #Get rid of communities and move it to URL class

    Examples:
      | web        | user       | landing    |
      | gmail      | Nina       | Gmail Home |
      | facebook   | Alex-FB    | FB Home    |
      | linkedin   | Nina       | LI Home    |