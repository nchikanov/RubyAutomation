

Then(/^I verify that flight info from "([^"]*)" to "([^"]*)" with "([^"]*)", "([^"]*)", and "([^"]*)" in "([^"]*)" is displayed$/) do |airport1, airport2, seniors, adults, children, class_type|
  @util.verifyElementExists('Departure Airport', airport1)
  @util.verifyElementExists('Arrival Airport', airport2)
  @util.verifyElementExists('Class Type', class_type)

  totalpassengers = seniors.to_i + adults.to_i + children.to_i
  @util.verifyElementExists('Total Passengers', totalpassengers)

end

When(/^I set the radio button to "([^"]*)"$/) do |arg|
  @bookflightspage.selectRadioButton(arg)
end

And(/^I set the "([^"]*)" fields with "([^"]*)" value and "([^"]*)" value$/) do |element, value1, value2|
  @bookflightspage.set2values(element, value1, value2)
end