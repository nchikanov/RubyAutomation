

Then(/^I verify that flight info from "([^"]*)" to "([^"]*)" with "([^"]*)", "([^"]*)", and "([^"]*)" in "([^"]*)" is displayed$/) do |airport1, airport2, seniors, adults, children, class_type|
  airport1_input = find(:xpath, ".//*[@id='departure']/div[1]/div[1]/div[contains(text(),'#{airport1}')]")
  airport2_input = find(:xpath, ".//*[@id='departure']/div[2]/div[1]/div[contains(text(), '#{airport2}')]")
  classtype_input = find(:xpath, ".//*[@id='summary-form']/div[3]/div[7]/div/div[2]/ol/a/span[text()='#{class_type}']")

  totalpassengers = seniors.to_i + adults.to_i + children.to_i
  totpass_input = find(:xpath, ".//*[@id='summary-form']/div[3]/div[7]/div/div[1]/div[1]/div[1]/span[1][text()='#{totalpassengers}']")

  if airport1_input && airport2_input && classtype_input && totpass_input
    print "The correct flight information was generated from #{airport1} to #{airport2} with #{totalpassengers} passengers in #{class_type} \n"
  else
    fail(ArgumentError.new("Incorrect flight info generated!"))
  end

end