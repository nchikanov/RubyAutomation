

Then(/^I verify that flight info from "([^"]*)" to "([^"]*)" with "([^"]*)", "([^"]*)", and "([^"]*)" in "([^"]*)" is displayed$/) do |airport1, airport2, seniors, adults, children, class_type|
  @util.verifyElementExists('Departure Airport', airport1)
  @util.verifyElementExists('Arrival Airport', airport2)
  @util.verifyElementExists('Class Type', class_type)

  totalpassengers = seniors.to_i + adults.to_i + children.to_i
  @util.verifyElementExists('Total Passengers', totalpassengers)

end

Then(/^I verify that flight info from "([^"]*)" to "([^"]*)" to "([^"]*)" with "([^"]*)", "([^"]*)", and "([^"]*)" in "([^"]*)" is displayed$/) do |place1, place2, place3, seniors, adults, children, class_type|
  @util.verifyElementExists('Airport 1 From', place1)
  @util.verifyElementExists('Airport 1 To', place2)
  @util.verifyElementExists('Airport 2 From', place2)
  @util.verifyElementExists('Airport 2 To', place3)
  @util.verifyElementExists('Airport 3 From', place3)
  @util.verifyElementExists('Airport 3 To', place1)
  @util.verifyElementExists('Multi Class Type', class_type)

  totalpassengers = seniors.to_i + adults.to_i + children.to_i
  @util.verifyElementExists('Multi Total Passengers', totalpassengers)
end

When(/^I set the radio button to "([^"]*)"$/) do |arg|
  @bookflightspage.selectRadioButton(arg)
end

And(/^I set the "([^"]*)" fields with "([^"]*)" value and "([^"]*)" value$/) do |element, value1, value2|
  @bookflightspage.set2values(element, value1, value2)
end


And(/^I set the "([^"]*)" field with "([^"]*)" value$/) do |element, value|
  @bookflightspage.setValue(element, value)
end

And(/^I set the "([^"]*)" fields with "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" and "(.*) values$/) do |element, place1, place2, place3, time1, time2, time3|
  datepicked = Date.today+7

  element1 = "Where and when are you going"
  element2 = "Where and when are you going_2"
  element3 = "Where and when are you going_3"

  @bookflightspage.set2values(element1, place1, place2)
  @mainpage.clickButton('departure date')
  @util.selectDateFromDatePicker(datepicked.strftime('%m/%d/%Y'))
  @bookflightspage.setValue(element1, time1)

  @bookflightspage.set2values(element2, place2, place3)
  @mainpage.clickButton('departure date 2')
  @util.selectDateFromDatePicker((datepicked+30).strftime('%m/%d/%Y'))
  @bookflightspage.setValue(element2, time2)

  @bookflightspage.set2values(element3, place3, place1)
  @mainpage.clickButton('departure date 3')
  @util.selectDateFromDatePicker((datepicked+60).strftime('%m/%d/%Y'))
  @bookflightspage.setValue(element3, time3)
end
