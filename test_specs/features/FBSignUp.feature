Feature: Facebook Sign Up

  Scenario Outline: Verify that Facebook sends confirmation email after new account is created
    Given I navigate to the external "<web>" site and I create a new "<user>" with birthday "<month>" "<day>" "<year>" and "<gender>"
    When I login to the "<email provider>" with the given "<credentials>"
    Then I verify "<our>" user received a "Just one more step to get started on Facebook" email notification with "You recently registered for Facebook" content

  Examples:
    | web       | user       | month | day | year | gender | email provider | credentials | our   |
    | facebook  | Mario      | Mar   | 10  | 1984 | M      | gmail          | Mario       | Mario |
    #| facebook  | Luigi      | Sep   | 4   | 1990 | F      | gmail          | Luigi       | Luigi |
    #| facebook  | Wario      | Jul   | 26  | 1997 | M      | gmail          | Wario       | Wario |
