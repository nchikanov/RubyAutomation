And(/^I click on the "([^"]*)" main menu tab$/) do |link|
  case link
    when 'Home','Activity','Challenges','Administration','View Ideas','Post Idea','Dashboard','Leaderboard','Pairwise' then
      @homepage.clickLink(link)
    else
      @mainpage.click_specific_link(link)
      sleep 2
  end
end

And(/^I click on the "([^"]*)" tab$/) do |tab|
  @mainpage.click_specific_link(tab)
  sleep 1
  sleep 2 if tab=='Profile My Tasks'
end

And(/^I click on the "([^"]*)" widget$/) do |link|
  @mainpage.click_specific_link(link)
end

And(/^I click on the "([^"]*)" link$/) do |link|
  @mainpage.click_specific_link(link)
  sleep 3
end

And(/^I click on the "([^"]*)" button$/) do |button|
  sleep 1
  @mainpage.clickButton(button)
  if button == 'Post your Rating' or button == 'Task Update'
    @generalreview.setIdeaReview(@mainpage.getCurrentIdea, @mainpage.getCurrentUser, @generalreview.getCurrentReview)
  end
  sleep 1
end

When(/^I fill in "([^"]*)" field with "([^"]*)" value$/) do |field, value|
  if field == 'Idea Submit Confirmation Message' or field == 'Additional Terms' or field == 'Top Search'
    @mainpage.fill_value(field, '')
  end
  @mainpage.fill_value(field, value)
end

And(/^I check the "([^"]*)" checkbox$/) do |field|
  @mainpage.setCheckbox(field, true)
  sleep 0.4
end

When(/^I set "([^"]*)" page as top level tab if it isn't already$/) do |page|
  @homepage.hoverMoreMainMenuTab
  unless @homepage.verifyElementExists(page)
    @homepage.clickLink('Administration')
    @administrationpage.clickLink('Site Editor')
    @administrationpage.clickLink(page)
    @administrationpage.setCheckbox('Top Level Tab', true)
    @administrationpage.clickButton('Update')
    @administrationpage.clickLink('Back to Administration')
  end
end

And(/^I click on the "([^"]*)" title$/) do |title|
  @mainpage.click_specific_link(title)
end

And(/^I click on the alert window's "([^"]*)" button$/) do |value|
  if value == 'OK'
    sleep 1
    @mainpage.closeAlertWindow(true)
  elsif value == 'Cancel'
    @mainpage.closeAlertWindow(false)
  end
  sleep 1
end

And(/^I select "([^"]*)" value from the "([^"]*)" list on "([^"]*)" page$/) do |option, list, page|
  case page
    when 'Combine Ideas' then
      @mergecombinecopyideapage.selectDropdownOption list, option
    when 'Permission Settings' then
      @permissionsettingspage.selectOptionByName list, option
    when 'My Profile' then
      @myprofilepage.selectOptionByName list, option
    when 'Leaderboard' then
      @leaderboardpage.selectOptionByName list, option
    when 'Category' then
      @categorypage.selectOptionByName list, option
     when 'View Ideas'
      @viewideaspage.selectDropdownOption list, option
    else
      fail(ArgumentError.new("'#{page}' page is not listed."))
  end
end

And(/^I verify that "(.*?)" value is "([^"]*)" in "([^"]*)" element on "([^"]*)" page$/) do |value, displaying_option, element, page|
  displayValue = displaying_option =='displayed'? true : false
  sleep 2
  case page
    when 'View Idea', 'Report Abuse'
      @viewideapage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'Users'
      @userspage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'Home'
      @homepage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'My Profile'
      @myprofilepage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'Administration', 'Email Users','Site Themes and Access Settings'
      @administrationpage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'Activity' then
      @activitypage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'Innovation Market','View Thread','View Sector' then
      @innovationmarketpage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'Category','Moderate Spam','Edit Category' then
      @categorypage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'Idea Popup' then
      @ideapopuppage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'Login','Forgot Password' then
      @loginpage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'Idea Management' then
      @ideamanagementpage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'Edit Challenge' then
      @challengespage.verifyElementExistsWithText(element, value).should eq(displayValue)
    when 'Leaderboard' then
      @leaderboardpage.verifyElementExistsWithText(element, value).should eq(displayValue)
    else
      fail(ArgumentError.new("'#{page}' page is not listed."))
  end
end

Then(/^I verify that "([^"]*)" message is displayed in "([^"]*)" page$/) do |message, page|
  case page
    when 'Merge Idea'
      @mergecombinecopyideapage.verifyMessage(message).should eq(true)
    when 'Site Themes and Settings', 'Email Users'
      @administrationpage.verifyMessage(message).should eq(true)
    when 'Users' then
      @userspage.verifyMessage(message).should eq(true)
    when 'Login','Forgot Password','Reset Password','Forgot Username','Change Password' then
      if message == 'Please follow the instructions in your email to continue.'
        @loginpage.verifyElementExists(message).should eq(true)
      else
        @loginpage.verifyMessage(message).should eq(true)
      end
    else
      fail(ArgumentError.new("'#{page}' page is not listed."))
  end
end

And(/^I fill in the "([^"]*)" field with "([^"]*)" value on "([^"]*)" page$/) do |field, value, page|
  case page
    when 'Create Community','Site Themes and Access Settings' then
      @createcommunitypage.fillValue(field, value)
    when 'Post Idea' then
      @postideapage.fillValue(field, value)
    when 'Change owner' then
      @changeownerpage.fillValue(field, value)
    when 'Combine Ideas' then
      @mergecombinecopyideapage.fillValue(field, value)
    when 'View Idea','Report Abuse' then
      @viewideapage.fillValue(field, value)
    when 'Users' then
      @userspage.fillValue(field, value)
    when 'My Profile' then
      @myprofilepage.fillValue(field, value)
    when 'View Ideas' then
      @viewideaspage.fillValue(field, value)
    when 'DPA' then
      @dpapage.fillValue(field, value)
    when 'Activity' then
      @activitypage.fillValue(field, value)
    when 'Idea Management' then
      @ideamanagementpage.fillValue(field, value)
    when 'Category' then
      @categorypage.fillValue(field, value)
    when 'Post New Category Thread' then
      @innovationmarketpage.fillValue(field, value)
    when 'Home' then
      @homepage.fillValue(field, value)
    when 'New Challenge','Edit Challenge' then
      @challengespage.fillValue(field, value)
    when 'Login','Forgot Username','Forgot Password','Reset Password','Change Password' then
      @loginpage.fillValue(field, value)
    when 'Security' then
      @securitypage.fillValue(field, value)
    when 'Idea Popup' then
      @ideapopuppage.fillValue(field, value)
    when 'Graduation Thresholds' then
      @graduationthresholdspage.fillValue(field, value)
    when 'Administration', 'Email Users' then
      @administrationpage.fillValue(field, value)
    when 'Turn On/Off Features' then
      @turnonofffeaturespage.fillValue(field, value)
    else
      fail(ArgumentError.new("'#{page}' field is not listed!"))
  end
end

And(/^I fill in the "([^"]*)" field on "([^"]*)" page with (.*) value$/) do |field, page, value|
  case page
    when 'DPA' then
      @dpapage.fillValue(field, value)
    else
      fail(ArgumentError.new("'#{page}' page is not listed!"))
  end
  sleep 0.5
end

And(/^I select "([^"]*)" option from the "([^"]*)" dropdown on "([^"]*)" page$/) do |option, dropdown, page|
  case page
    when 'DPA'
      @dpapage.selectDropdownOption dropdown, option
    when 'Create Community','Site Themes and Access Settings' then
      @createcommunitypage.selectDropdownOption dropdown, option
    when 'Merge Idea','Combine Ideas','Copy Idea To Another Community' then
      @mergecombinecopyideapage.selectDropdownOption dropdown, option
    when 'View Idea' then
      @viewideapage.selectDropdownOption dropdown, option
    when 'View Ideas' then
      @viewideaspage.selectDropdownOption dropdown, option
    when 'Post Idea' then
      @postideapage.selectDropdownOption dropdown, option
    when 'My Profile' then
      @myprofilepage.selectDropdownOption dropdown, option
    when 'New Challenge' then
      @challengespage.selectDropdownOption dropdown, @communities.getChallengeTemplate(@mainpage.getCurrentSite, option).name
    when 'Challenges' then
      @challengespage.selectDropdownOption dropdown, option
    when 'Evaluation Templates' then
      @evaluationtemplatespage.selectDropdownOption dropdown, option
    when 'Email Templates' then
      @emailtemplatespage.selectDropdownOption dropdown, option
    when 'View Sector' then
      @innovationmarketpage.selectDropdownOption dropdown, option
    else
      fail(ArgumentError.new("'#{page}' page is not listed!"))
  end
end

And(/^I click on the "([^"]*)" link on "([^"]*)" page$/) do |link, page|
  case page
    when 'View Idea' then
      @viewideapage.clickLink(link)
    when 'View Ideas' then
      @viewideaspage.clickLink(link)
    when 'Administration','Site Editor','Dashboard','Site Themes and Access Settings' then
      @administrationpage.clickLink link
    when 'Users' then
      @userspage.clickLink link
    when 'Home' then
      @homepage.clickLink link
    when 'My Profile' then
      @myprofilepage.clickLink link
    when 'My Inbox' then
      @myinboxpage.clickLink link
    when 'Activity' then
      @activitypage.clickLink link
    when 'Store' then
      @storepage.clickLink link
    when 'Communities' then
      @communitiespage.clickLink link
    when 'Innovation Market','View Sector' then
      @innovationmarketpage.clickLink link
    when 'Category' then
      @categorypage.clickLink link
    when 'Idea Popup' then
      @ideapopuppage.clickLink link
    when 'Login','Forgot Username' then
      @loginpage.clickLink link
    when 'Email Templates' then
      if link=='Tasks' or link=='Content Management' or link=='Comments' or link=='Users'
        @util.waitForElement('xpath',".//*[@id='div-Settings']/h2",5)
      end
      @emailtemplatespage.clickLink link
    when 'Challenges','Edit Challenge' then
      @challengespage.clickLink link
    else
      fail(ArgumentError.new("'#{page}' page is not listed."))
  end
end

And(/^I click on the "([^"]*)" tab on the "([^"]*)" page$/) do |tab, page|
  step "I click on the \"#{tab}\" link on \"#{page}\" page"
end

And(/^I set "([^"]*)" checkbox to "([^"]*)" value on "([^"]*)" page$/) do |checkbox, value, page|
  boolValue = value =='true'? true : false
  case page
    when 'Security' then
      @securitypage.setCheckbox(checkbox, boolValue)
    when 'Legal' then
      @legalpage.setCheckbox(checkbox, boolValue)
    when 'Turn On/Off Features' then
      @turnonofffeaturespage.setCheckbox(checkbox, boolValue)
    when 'DPA'
      @dpapage.setCheckbox(checkbox, boolValue)
    when 'Users', 'Edit User'
      @userspage.setCheckbox(checkbox, boolValue)
    when 'Anonymous', 'Administration','Site Editor' then
      @administrationpage.setCheckbox(checkbox, boolValue)
    when 'Post Idea' then
      @postideapage.setCheckbox(checkbox, boolValue)
    when 'User Experience Management' then
      @userexperiencemanagementpage.setCheckbox(checkbox, boolValue)
    when 'Home' then
      @homepage.setCheckbox(checkbox, boolValue)
    when 'Idea Management' then
      @ideamanagementpage.setCheckbox(checkbox, boolValue)
    when 'My Profile' then
      @myprofilepage.setCheckbox(checkbox, boolValue)
    when 'Category' then
      @categorypage.setCheckbox(checkbox, boolValue)
    when 'Review Template' then
      @evaluationtemplatespage.setCheckbox(checkbox, boolValue)
    when 'Site Themes and Access Settings' then
      @createcommunitypage.setCheckbox(checkbox, boolValue)
    when 'Register', 'Login', 'Terms and Conditions' then
      @loginpage.setCheckbox(checkbox, boolValue)
    when 'Challenges','Edit Challenge' then
      @challengespage.setCheckbox(checkbox, boolValue)
    else
      fail(ArgumentError.new("'#{page}' page is not listed."))
  end
  sleep 0.2
end

# Click on a button on different pages
And(/^I click on the "([^"]*)" button in "([^"]*)" page$/) do |button, page|
  case page
    when 'My Inbox' then
      @myinboxpage.clickButton button
    when 'Administration', 'Anonymous','Idea Information Display','Display Ideas in Other Communities', 'Email Users' then
      @administrationpage.clickButton button
    when 'Site Editor' then
      @administrationpage.clickButton button
      sleep 2
    when 'My Profile' then
      @myprofilepage.clickButton button
    when 'Create Community','Site Themes and Access Settings' then
      @createcommunitypage.clickButton button
    when 'Security' then
      @securitypage.clickButton button
    when 'Legal' then
      @legalpage.clickButton button
    when 'DPA' then
      @dpapage.clickButton button
    when 'Post Idea' then
      @postideapage.clickButton button
    when 'Merge Idea','Combine Ideas','Copy Idea To Another Community' then
      @mergecombinecopyideapage.clickButton button
    when 'View Idea','Move this Idea','Review Task Form','Review Details','Evaluation Form Task','Evaluation Form Details' then
      @viewideapage.clickButton button
    when 'Change owner' then
      @changeownerpage.clickButton button
    when 'View Ideas' then
      @viewideaspage.clickButton button
    when 'Permission Settings' then
      @permissionsettingspage.clickButton button
    when 'Users', 'Edit User' then
      @userspage.clickButton button
    when 'Turn On/Off Features' then
      @turnonofffeaturespage.clickButton button
    when 'Home','Change Subscription Notification Status' then
      @homepage.clickButton button
    when 'Idea Template Editor' then
      @ideatemplatepage.clickButton button
    when 'User Experience Management' then
      @userexperiencemanagementpage.clickButton button
    when 'Idea Management' then
      @ideamanagementpage.clickButton button
    when 'Activity' then
      @activitypage.clickButton button
    when 'Graduation Thresholds' then
      @graduationthresholdspage.clickButton button
    when 'Idea Popup' then
      @ideapopuppage.clickButton button
    when 'Category' then
      @categorypage.clickButton button
    when 'Post New Category Thread','Move this category' then
      @innovationmarketpage.clickButton button
    when 'New Challenge','Edit Challenge'then
      @challengespage.clickButton button
    when 'Evaluation Templates','Review Template','Add New Review Form','Review Details','Evaluation Form Template' then
      @evaluationtemplatespage.clickButton button
    when 'Login','Forgot Username','Forgot Password','Reset Password','Register','Reset Password','Change Password','Terms and Conditions' then
      @loginpage.clickButton button
    when 'Email Templates' then
      @emailtemplatespage.clickButton button
    else
      fail(ArgumentError.new("'#{page}' page is not listed."))
  end
end

And(/^I add "([^"]*)" user as Moderator of "([^"]*)" category\(ies\)$/) do |user, categories|
  username = @users.getUser(user, 'username')
  @homepage.clickLink('Administration')
  @administrationpage.clickLink('Moderators')
  @administrationpage.fillValue('New Moderator Username', username)
  @administrationpage.selectAutosuggestUser('Moderator',username)
  within(:xpath,".//form[@name='MODERATOR_MANAGER']") do
    categories.split(',').each do |category|
      if category == 'All'
        find('#sectors_all').click if has_css?('#sectors_all')
      else
        find(:xpath,".//input[contains(@name,'sectors') and contains(@title,'#{@mainpage.getCategoryTitle(category)}')]").click
      end
    end
    @administrationpage.clickButton('Submit')
  end
  sleep 3
end

And(/^I verify that "([^"]*)" email processed by "([^"]*)" user for "([^"]*)" idea "([^"]*)" to "([^"]*)"'s email$/) do |notification, modifier_user, idea, arriving_type, owner_user|
  emailExpected = arriving_type =='arrived'? true : false
  sleep 10
  emailacc = @users.getUser(owner_user,'email')
  emailpsw = @users.getUser(owner_user,'emailpsw')
  match = emailacc[/\+(.*?)@/m]
  emailacc = emailacc.gsub(match,'@') unless match.nil? #retrieving mail w/o alias
  modFirstName = @users.getUser(modifier_user,'firstname')
  modLastName = @users.getUser(modifier_user,'lastname')
  modifierName = modFirstName + ' ' + modLastName

  case notification
    when 'Content Edited Notice'
      @subject = "Your Idea, (#{@mainpage.getIdeaTitle(idea)}) was edited by #{modifierName}."
      @inboxemails = @mainpage.getCountEmailsReceived(emailacc, emailpsw, @subject)
    when 'Idea Moved to Different Category Notice'
      @subject = "Your Idea (#{@mainpage.getIdeaTitle(idea)}) was moved by #{modifierName}."
      @inboxemails = @mainpage.getCountEmailsReceived(emailacc, emailpsw, @subject)
    when 'Your idea graduated.','Idea Graduation Notice.'
      if $version >= 390
        @subject = 'Idea Graduation Notice.'
        content = "Congratulations! (#{@mainpage.getIdeaTitle(idea)}), moved to a new stage! Contact your Administrator or Moderator for any questions or comments."
      else
        @subject = 'Your idea graduated.'
        content = "Your idea, (#{@mainpage.getIdeaTitle(idea)}), moved to a new stage! Contact your Administrator or Moderator for any questions or comments."
      end
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, @subject, content)
    when 'New user'
      @subject = 'User added'
    else
      fail(ArgumentError.new("'#{notification}' notification is not listed!"))
  end
  if @inboxemails == 0 and emailExpected
    fail(ArgumentError.new("No '#{@subject}' email notification received by #{owner_user}!"))
  end
end

Then(/^I verify "([^"]*)" user received a "([^"]*)" email notification due to "([^"]*)" user's action on "([^"]*)" idea$/) do |user, notification, user_action, idea|
  step "I verify that \"#{notification}\" email processed by \"#{user_action}\" user for \"#{idea}\" idea \"arrived\" to \"#{user}\"'s email"
end

# General step tp verify an email notification given an idea
Then(/^I verify that "([^"]*)" received an "([^"]*)" email notification for "([^"]*)" idea$/) do |user, notification, idea|
  sleep 10
  emailacc = @users.getUser(user,'email')
  emailpsw = @users.getUser(user,'emailpsw')
  match = emailacc[/\+(.*?)@/m]
  emailacc = emailacc.gsub(match,'@') unless match.nil? #retrieving mail w/o alias

  case notification
    when 'Idea Merged Notice' then
      subject = "Your Idea #{@mainpage.getIdeaTitle(idea)} has been merged into another idea."
      @inboxemails = @mainpage.getCountEmailsReceived(emailacc, emailpsw, subject)
    when 'Idea Closed Unsuccessfully Notice due to merge' then
      preffix = $version >= 390? "":"Your Idea, "
      subject = preffix + "(#{@mainpage.getIdeaTitle(idea)}), closed unsuccessfully."
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, subject,'This idea has been closed and merged into Idea.')
    else
      fail(ArgumentError.new("'#{notification}' notification is not listed."))
  end
  fail(ArgumentError.new("No '#{subject}' email was received!")) if @inboxemails == 0
end

Then(/^I verify that "([^"]*)" element is "([^"]*)" in "([^"]*)" page$/) do |element, displaying_option, page|
  displayValue = displaying_option =='displayed'? true : false
  case page
    when 'Users'
      @userspage.verifyElementExists(element).should eq(displayValue)
    when 'Email Templates'
      @emailtemplatespage.verifyElementExists(element).should eq(displayValue)
    when 'View Idea'
      @viewideapage.verifyElementExists(element).should eq(displayValue)
    when 'My Profile'
      @myprofilepage.verifyElementExists(element).should eq(displayValue)
    when 'Leaderboard' then
      @leaderboardpage.verifyElementExists(element).should eq(displayValue)
    when 'Category' then
      @categorypage.verifyElementExists(element).should eq(displayValue)
    when 'Innovation Market','Post New Category Thread','View Thread','View Sector' then
      @innovationmarketpage.verifyElementExists(element).should eq(displayValue)
    when 'Post Idea' then
      @postideapage.verifyElementExists(element).should eq(displayValue)
    when 'Idea Template Editor' then
      @ideatemplatepage.verifyElementExists(element).should eq(displayValue)
    when 'Site Themes and Access Settings' then
      @createcommunitypage.verifyElementExists(element).should eq(displayValue)
    when 'Report Abuse' then
      @viewideapage.verifyElementExists(element).should eq(displayValue)
    when 'Login','Forgot Username','Forgot Password' then
      @loginpage.verifyElementExists(element).should eq(displayValue)
    when 'Home' then
      @homepage.verifyElementExists(element).should eq(displayValue)
    when 'View Ideas'
      @viewideaspage.verifyElementExists(element).should eq(displayValue)
    when 'Edit Challenge'
      @challengespage.verifyElementExists(element).should eq(displayValue)
    when 'Administration', 'Email Users' then
      @administrationpage.verifyElementExists(element).should eq(displayValue)
    when 'Search Communities' then
      @communitiespage.verifyElementExists(element).should eq(displayValue)
    when 'Idea Management' then
      @ideamanagementpage.verifyElementExists(element).should eq(displayValue)
    when 'Turn On/Off Features'
      @turnonofffeaturespage.verifyElementExists(element).should eq(displayValue)
    when 'Activity Stream'
      @activitypage.verifyElementExists(element).should eq(displayValue)
    else
      fail(ArgumentError.new("'#{page}' page is not listed!"))
  end
end

Then(/^I verify that "([^"]*)" field is displayed into "([^"]*)" page$/) do |fieldName, page|
  if page == 'Administration>User'
    case fieldName
      when 'Search Users' then
        has_xpath?(".//*[@id='user_admin_fresh']//input[@id='keywords' and contains(@title,'Search Users')]").should eq(true)
      when 'Search' then
        has_xpath?(".//*[@id='user_admin_fresh']//a[@title='Search']").should eq(true)
      else
        fail(ArgumentError.new("'#{fieldName}' field is not listed!"))
    end
  end
end

And(/^I click on the "([^"]*)" item on "([^"]*)" list on "([^"]*)" page$/) do |item, list, page|
  case page
    when 'Users'
      @userspage.clickLinkInList(list,item)
    when 'Home'
      @homepage.clickLinkInList(list,item)
    when 'Activity' then
      @activitypage.clickLinkInList(list,item)
    when 'My Profile' then
      @myprofilepage.clickLinkInList(list,item)
    when 'View Ideas' then
      @viewideaspage.clickLinkInList(list,item)
    when 'Leaderboard' then
      @leaderboardpage.clickLinkInList(list,item)
    when 'Innovation Market'
      @innovationmarketpage.clickLinkInList(list,item)
    when 'Search Communities' then
      @communitiespage.clickLinkInList(list,item)
    when 'Site Themes and Access Settings' then
      @administrationpage.clickLinkInList(list,item)
    when 'View Idea' then
      @viewideapage.clickLinkInList(list,item)
    else
      fail(ArgumentError.new("'#{page}' page is not listed!"))
  end
end

Then(/^I verify the "([^"]*)" error message is displayed to the user$/) do |message|
  sleep 2
  case message
    when 'Search title already exists. Do you want to override?'
      fail(ArgumentError.new("'#{message}' message is not displayed!")) unless has_xpath?(".//div[contains(@class,'left error')][text()='#{message}']")
    when  'Unable to find results for search query.',
          'Value is required.' then
      within(:xpath, ".//div[@id='messageId' or @id='error']") do
        fail(ArgumentError.new("'#{message}' message is not displayed!")) unless has_text?(message)
      end
    when 'You must agree to all terms to continue.'
      fail(ArgumentError.new("'#{message}' message is not displayed!")) unless has_xpath?(".//div[@class ='formError'][text()='#{message}']")
    else
      fail(ArgumentError.new("'#{message}' message is not listed!"))
  end
end

And(/^I expand the "([^"]*)" widget on "([^"]*)" page$/) do |widget, page|
  case page
    when 'View Idea' then
      @viewideapage.expandWidget(widget)
    when 'My Profile' then
      @myprofilepage.expandWidget(widget)
    when 'Leaderboard' then
      @leaderboardpage.expandWidget(widget)
    when 'Innovation Market' then
      @innovationmarketpage.expandWidget(widget)
    when 'View Ideas' then
      @viewideaspage.expandWidget(widget)
    when 'Category' then
      @categorypage.expandWidget(widget)
    when 'New Challenge', 'Edit Challenge' then
      @challengespage.expandWidget(widget)
    else
      fail(ArgumentError.new("'#{page}' page is not listed!"))
  end
end

And(/^I expand the "([^"]*)" widget on "([^"]*)" page if it exists$/) do |widget, page|
  case page
    when 'View Idea' then
      @viewideapage.expandWidget(widget) if @viewideapage.has_controlpanel_header?
    else
      fail(ArgumentError.new("'#{page}' page is not listed!"))
  end
end

Then(/^I verify the "([^"]*)" button is disabled on "([^"]*)" page$/) do |button, page|
  case page
    when 'Users' then
      @isDisabled = @userspage.verifyButtonIsDisabled button
    when 'Reset Password','Forgot Password','Register' then
      @isDisabled = @loginpage.verifyButtonIsDisabled button
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
  fail(ArgumentError.new("'#{button}' button is enabled!")) unless @isDisabled
end

# To add a custom field, or all, to the Idea Template
When(/^I add "([^"]*)" custom field\(s\) to the Idea template$/) do |field|
  @ideatemplatepage.dragDropIdeaTemplateField(field)
end

When(/^I add "([^"]*)" custom field\(s\) to the Idea template besides the current set$/) do |field|
  @ideatemplatepage.dragDropAnotherIdeaTemplateField(field)
end

# Fills the description field with a random string and the given category
And(/^I select "([^"]*)" category and fill in \"Description\" field with some value$/) do |category|
  @postideapage.selectDropdownOption('Category', category)
  @category = @mainpage.getCategoryTitle(category)
  @description = Forgery('lorem_ipsum').sentences(5, :random => true)
  @postideapage.fillValue('Description', @description)
end

# Fills custom fields with random values
And(/^I fill in "([^"]*)" custom field with some value$/) do |field|
  case field
    when /Text Field/,/TextField/ then
      @textField = Forgery('lorem_ipsum').words(5, :random => true).capitalize
      @postideapage.fillInPostIdeaCustomField(field, @textField)
    when /Description/ then
      @description = Forgery('lorem_ipsum').sentences(5, :random => true)
      @postideapage.fillInPostIdeaCustomField(field, @description)
    when /Rich Text Editor/,/RichTextEditor/ then
      textEditor = Forgery('lorem_ipsum').sentences(5, :random => true)
      @richTextEditor = textEditor.gsub('ue','ub') #Bypass sendkeys bug
      @postideapage.fillInPostIdeaCustomField(field, @richTextEditor)
    when /Date Field/,/DateField/ then
      today = Date.today
      days = Date.new(today.strftime('%Y').to_i,today.strftime('%m').to_i, -1).day
      @dateField = "#{today.strftime('%m')}/#{rand(10..days)}/#{today.strftime('%Y')}"
      ##to delete
      @postideapage.fillInPostIdeaCustomField(field, @dateField)
    when /Drop Down/,/DropDown/ then
      @dropDown = @postideapage.fillInPostIdeaCustomField(field, 'random')
    when /Checkbox Group/,/CheckboxGroup/ then
      @checkboxGroup = @postideapage.fillInPostIdeaCustomField(field, 'random')
    when /Checkbox/,/CheckField/ then
      @checkbox = @postideapage.fillInPostIdeaCustomField(field, 'random')
    when /Radio Group/,/RadioGroup/ then
      @radioGroup = @postideapage.fillInPostIdeaCustomField(field, 'random')
    else
      fail(ArgumentError.new("#{field} DOES NOT EXIST!"))
  end
end

# Fills any type of custom field with a given value
And(/^I fill in "([^"]*)" custom field with "([^"]*)" value$/) do |field, value|
  @postideapage.fillInPostIdeaCustomField(field, value)
  case field
    when /Text Field/, /Rich Text Editor/ then
      puts 'Text Field'
    when /Drop Down/ then
      @dropDown = value
    when /Checkbox Group/ then
      @checkboxGroup = value
    when /Checkbox/ then
      @checkbox = value
    when /Radio Group/ then
      @radioGroup = value
    when /User With Autosuggest/,/UserWithAutosuggest/ then
      @userWithAutosuggest = value
      sleep 1
    else
      fail(ArgumentError.new("#{field} DOES NOT EXIST!"))
  end
end

Then(/^I verify "([^"]*)" idea is closed$/) do |idea|
  has_xpath?(".//*[@id='idea-detail']/div[contains(@class,'closedIdea') and contains(@class,'closedIdea')]").should eq(true)
end

When(/^I remove "([^"]*)" custom field\(s\) from the Idea template$/) do |fieldLabel|
  if fieldLabel == 'all'
    elements = ['Text Field','Drop Down','Rich Text Editor','Checkbox','Checkbox Group','Radio Group','Date Field','User With Autosuggest']
    elements.each do |element|
      @ideatemplatepage.clickIdeaTemplateRemoveItem('Remove Item',element)
      find(:xpath,".//div[@class='ui-dialog-buttonset']/button[span[text()='Yes']]").click if has_xpath?(".//div[@class='ui-dialog-buttonset']/button[span[text()='Yes']]")
      sleep 0.5
    end
  else
    @ideatemplatepage.clickIdeaTemplateRemoveItem('Remove Item', fieldLabel)
    find(:xpath,".//div[@class='ui-dialog-buttonset']/button[span[text()='Yes']]").click if has_xpath?(".//div[@class='ui-dialog-buttonset']/button[span[text()='Yes']]")
    sleep 0.5
  end
end

And(/^I verify the "([^"]*)" field (.*) displayed on the "([^"]*)" page$/) do |field, displayed, page|
  is_displayed = displayed == 'is' ? true : false
  case page
    when 'New Challenge','Edit Challenge' then
      @mainpage.verifyElementExists(field).should eq(is_displayed)
    when 'Challenges' then
      @challengespage.verifyElementExists(field).should eq(is_displayed)
    when 'Home' then
      @homepage.verifyElementExists(field).should eq(is_displayed)
    when 'Sign In','Login' then
      @loginpage.verifyElementExists(field).should eq(is_displayed)
    when 'View Thread' then
      @innovationmarketpage.verifyElementExists(field).should eq(is_displayed)
    when 'Category' then
      @categorypage.verifyElementExists(field).should eq(is_displayed)
    when 'Forgot Password' then
      @loginpage.verifyElementExists(field).should eq(is_displayed)
    when 'My Profile' then
      @myprofilepage.verifyElementExists(field).should eq(is_displayed)
    when 'View Idea' then
      @viewideapage.verifyElementExists(field).should eq(is_displayed)
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

# Uses same step that verifies fields (above), add needed cases there
And(/^I verify the "([^"]*)" button (.*) displayed on the "([^"]*)" page$/) do |button, displayed, page|
  step "I verify the \"#{button}\" field #{displayed} displayed on the \"#{page}\" page"
end

# Uses same step that verifies fields (above), add needed cases there
And(/^I verify the "([^"]*)" link (.*) displayed on the "([^"]*)" page$/) do |link, displayed, page|
  step "I verify the \"#{link}\" field #{displayed} displayed on the \"#{page}\" page"
end

# Uses same step that verifies fields (above), add needed cases there
And(/^I verify the "([^"]*)" dropdown (.*) displayed on the "([^"]*)" page$/) do |link, displayed, page|
  step "I verify the \"#{link}\" field #{displayed} displayed on the \"#{page}\" page"
end

Then(/^I verify the "([^"]*)" main menu tab (.*) displayed$/) do |menu, is_displayed|
  displayed = is_displayed == 'is' ? true : false
  @homepage.verifyElementExists(menu).should eq(displayed)
end

# To verify if an element is displayed in a widget
Then(/^I verify the "([^"]*)" (.*) displayed on the "([^"]*)" widget$/) do |element, is_displayed, widget|
  @be_displayed = is_displayed == 'is not' ? false : true
  case widget
    when 'Idea Team Members' then
      within @viewideapage.ideateammembers_container do
        @viewideapage.verifyElementExists(element).should eq(@be_displayed)
      end
    when 'Idea Stats' then
      has_xpath?(".//*[@id='idea_stats']//a[contains(text(),'#{@mainpage.getCategoryTitle(element)}')]").should eq(@be_displayed)

    else
      fail(ArgumentError.new("'#{widget}' widget is not listed!"))
  end
end

# To verify popup messages
Then(/^I verify the "([^"]*)" popup message is displayed$/) do |message|
  case message
    when  'All settings applied.',
          'Request sent.',
          'Invitation Sent',
          'Update successful.',
          'Successfully Updated',
          'Membership Rejected',
          'Membership Accepted',
          'Information submitted and will be published upon approval.',
          'Team Member request cancelled.',
          'Template saved.',
          'Phase email template has been updated successfully.',
          'Successfully removed the language from being displayed in the language preference widget',
          'Contents successfully updated',
          'Selected winners updated.',
          'Please fill all marked fields.',
          'Some required fields are left empty. Please correct all highlighted fields.'
    then
      @message_xpath = ".//div[contains(@class,'popup-notice')][contains(text(),'#{message}')]"

    when  "This idea has been successfully moved to 'closed' stage",
          "This idea has been successfully moved to 'accepted' stage",
          "This idea has been successfully requested to be moved to 'closed' stage",
          "This idea has been successfully requested to be moved to 'accepted' stage",
          /.* is currently in use, please try again./ then
      message = message.gsub("'",34.chr)
      @message_xpath = ".//div[contains(@class,'popup-notice')][contains(text(),'#{message}')]"

    when  /This idea has been successfully moved to '.*' stage/ then
      message = message[/(.*').*' stage/,1].gsub("'",34.chr)
      @message_xpath = ".//div[contains(@class,'popup-notice')][contains(text(),'#{message}')]"

    when /Idea.s title, .* has been taken in the community of the selected category./ then
      ideaTitle = @mainpage.getIdeaTitle(@mainpage.getCurrentIdea)
      errorMessage = message.gsub(@mainpage.getCurrentIdea, 34.chr + ideaTitle + 34.chr)
      @message_xpath = ".//div[contains(@class,'popup-notice')][contains(.,'#{errorMessage}')]"

    when  /.* is too large, maximum file size is 10.0MB./,
          /.* is empty, please select files again./ then
      @message_xpath = ".//div[contains(@class,'popup-notice')][contains(.,'#{message.gsub('/test_files/','')}')]"

    when 'The following file types are not acceptable:  js, cgi, asp, jsp, pl, exe, bat, sh, html, htm' then
      @message_xpath = ".//div[@id='themeContainer']/div[contains(@style,'block;') and (contains(.,'#{message}') or contains(.,'The following file types are not acceptable:  js,cgi,asp,jsp,pl,exe,bat,sh,html,htm'))]"

    when  'Error: Username may contain letters a-z, numbers 0-9, underscores and a single dot.',
          'The username is missing.' then
      @message_xpath = ".//div[@id='errorMessage' and contains(.,'#{message}')]"

    when 'User information updated.' then
      @message_xpath = ".//div[@id='successMessage' and contains(.,'#{message}')]"

    when 'Terms and Conditions' then
      @message_xpath = ".//div[@aria-describedby='termsAndConditionsDialog']//*[text()='Terms & Conditions']"

    else
      fail(ArgumentError.new("'#{message}' is not listed!"))
  end
  @util.waitForElement('xpath', @message_xpath, 10)
  sleep 1 if message == 'All settings applied.' #small delay as some Administration settings are not saved immediately after the popup is displayed
end

And(/^I verify the "([^"]*)" popup is still displayed$/) do |popup|
  case popup
    when 'Close Idea' then
      @viewideapage.has_closeidea_container?.should eq(true)
    else
      fail(ArgumentError.new("'#{popup}' is not listed!"))
  end
end

And(/^I retrieve configuration of "([^"]*)" template on "([^"]*)" page$/) do |template, page|
  case page
    when 'Email Templates' then
      @emailtemplatespage.retrieveTemplateConfig(template)
    when 'Idea Template Editor' then
      @ideatemplatepage.retrieveTemplateConfig(template)
    else
      fail(ArgumentError.new("#{page} DOES NOT EXIST!"))
  end
end

Then(/^I verify that the "([^"]*)" message label is displayed$/) do |message|
  sleep 2
  case message
    when  "Settings updated.",
          "Permission settings updated.",
          "This idea has been successfully moved to 'accepted' stage.",
          "This idea has been successfully moved to 'closed' stage.",
          "Congratulations! Your order was executed",
          "All settings applied.",
          "Information submitted and will be published upon approval.",
          "Draft saved.",
          "Moderator setting updated.",
          "The draft has been saved. You can access your draft idea from your profile page.",
          "Inappropriate content has been used and is being reviewed by the Site Administrator.",
          "Subscription notification status saved.",
          "Typography Modification Successful" then
      message = message.gsub("'",34.chr)
      @util.elementExistsOnTime('css', '.success', 9)
      within('.success') do
        fail(ArgumentError.new("'#{message}' message is not displayed.")) unless has_text?(message)
      end
    when  'Your profile has been saved.',
          'Avatar uploaded.' then
      within('#successMessage') do
        fail(ArgumentError.new("'#{message}' message is not displayed.")) unless has_text?(message)
      end
    when  /User .* now has the .* role./,
          /User .* is no longer assigned the .* role./,
          /User .* locked./,
          /User .* unlocked./ then
      within('#successMessage') do
        message = message.gsub(message[/.* (\[.*\]) .*/,1],@users.getUser(message[/.* \[(.*)\] .*/,1], 'username'))
        fail(ArgumentError.new("'#{message}' message is not displayed.")) unless has_text?(message)
      end
    when /Idea Coordinator .* has been removed from this idea./ then
      within('.success') do
        user = message[/.* \[(.*)\] .*/,1]
        message = message.gsub(message[/.* (\[.*\]) .*/,1], "#{@users.getUser(user,'firstname')} #{@users.getUser(user,'lastname')}")
        fail(ArgumentError.new("'#{message}' message is not displayed.")) unless has_text?(message)
      end
    when  /User .* has been assigned as an Idea Coordinator of this idea./,
          /User .* has been created./ then
      within('.success') do
        user = message[/.* \[(.*)\] .*/,1]
        message = message.gsub(message[/.* (\[.*\]) .*/,1],@users.getUser(message[/.* \[(.*)\] .*/,1], 'username'))
        fail(ArgumentError.new("'#{message}' message is not displayed.")) unless has_text?(message)
      end
    when  /The idea.*s title .* is already taken. / then
      within('.error') do
        message = message.gsub(message[/(?<=title )(.*)(?= is)/,1],@mainpage.getIdeaTitle(message[/(?<=title )(.*)(?= is)/,1]))
        fail(ArgumentError.new("'#{message}' message is not displayed.")) unless has_text?(message)
      end
    when 'Task Processed' then
      within(:xpath, ".//*[@id='themeContainer']/div[3]") do
        fail(ArgumentError.new("'#{message}' message is not displayed.")) unless has_text?(message)
      end
      sleep 3
      @util.waitForElement('css', $css_verify_viewideapage, 25)
    when 'Access denied'
      @loginpage.verifyElementExists(message)
    else
      fail(ArgumentError.new("'#{message}' is not listed!"))
  end
end

And(/^I hover the mouse over the username link in "([^"]*)" Idea on View Ideas page$/) do |title|
  find(:xpath, ".//div[@class='idea-info-container' and h3[a[text()='#{@mainpage.getIdeaTitle(title)}']]]/span/a[contains(@class,'miniProfile-trigger')]").hover
end

And(/^I select "([^"]*)" value from the "([^"]*)" autosuggest list in "([^"]*)" page$/) do |value, list, page|
  case page
    when 'Activity' then
      @activitypage.selectAutosuggest(list,value)
    when 'View Idea'
      @viewideapage.selectAutosuggestUser(list,@users.getUser(value, 'username'))
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))

  end
end

And(/^I fill in the Reply Comment field to "([^"]*)" comment with "([^"]*)" reply on "([^"]*)" page$/) do |comment, reply, page|
  case page
    when 'Activity'
      @activitypage.replyComment(comment, reply)
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

Then(/^I verify that user is redirected to "([^"]*)" content in "([^"]*)" page$/) do |content, page|
  sleep 1
  case page
    when 'My Profile', 'User Profile'
      @myprofilepage.verifyLinkRedirection(content).should eq(true)
    when 'View Idea'
      @viewideapage.verifyLinkRedirection(content).should eq(true)
    when 'Category' then
      @categorypage.verifyLinkRedirection(content).should eq(true)
    when 'Innovation Market' then
      @innovationmarketpage.verifyLinkRedirection(content).should eq(true)
    when 'Home' then
      @homepage.verifyLinkRedirection(content).should eq(true)
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

When(/^I navigate to the "([^"]*)" page$/) do |page|
  url = @communities.getCommunityUrl(@mainpage.getCurrentSite)
  url = url.gsub(url[/.*spigit.com(.*)/,1],'')
  case page
    when 'Innovation Market' then
      visit("#{url}/Page/InnovationMarket")
      @util.elementExistsOnTime('css', $css_verify_innovationmarketpage, 5)
    when 'DPA' then
      visit("#{url}/Admin/Dashboard?orig_url=%2FAdmin%2FConfiguration%3Fsection%3DdevProductsAccess")
      @util.elementExistsOnTime('css', $css_verify_dpapage, 5)
    when 'Post Thread','Post New Category Thread' then
      visit("#{url}/Sector/PostThread?sectorid=" + $CategoryId)
      sleep 2
    when 'Category Discussion Forum' then
      visit("#{url}/Sector/ThreadsHome?sectorid=#{$CategoryId}")
      sleep 2
    else
      fail(ArgumentError.new("'#{page}' page is not listed."))
  end
end

Then(/^I verify that "([^"]*)" widget is displayed in "([^"]*)" page$/) do |widget, page|
  case page
    when 'Leaderboard' then
      @leaderboardpage.verifyElementExists(widget)
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

Then(/^I verify that "([^"]*)" checkbox is (.*) in "([^"]*)" page$/) do |checkbox, status, page|
  checkboxExpected = status =='checked'? true : false
  case page
    when 'Category' then
      @categorypage.verifyCheckbox(checkbox).should eq(checkboxExpected)
    when 'Site Themes and Access Settings' then
      @createcommunitypage.verifyCheckbox(checkbox).should eq(checkboxExpected)
    when 'Users' then
      @userspage.verifyCheckbox(checkbox).should eq(checkboxExpected)
    when 'Edit Challenge' then
      @challengespage.verifyCheckbox(checkbox).should eq(checkboxExpected)
    when 'Idea Management' then
      @ideamanagementpage.verifyCheckbox(checkbox).should eq(checkboxExpected)
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

And(/^I look for "([^"]*)" idea on "([^"]*)" section of the Activity Stream$/) do |idea, section|
  ideaTitle = @mainpage.getIdeaTitle(idea)
  @activitypage.clickLink(section)
  @activitypage.clickLink('Show Filters')
  @activitypage.fillValue('Enter a keyword', ideaTitle)
  @activitypage.clickButton('Search')
end

Then(/^I verify "([^"]*)" option (.*) displayed in "([^"]*)" dropdown in "([^"]*)" page$/) do |option, display_mode, dropdown, page|
  displayed = display_mode == 'is not'? false : true
  case page
    when 'Post Idea' then
      @postideapage.verifyDropDownItems(dropdown,option).should eq(displayed)
    when 'Evaluation Templates' then
      @evaluationtemplatespage.verifyDropDownOption(dropdown,option).should eq(displayed)
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

Then(/^I verify that "([^"]*)" idea is "([^"]*)" in "([^"]*)" page$/) do |idea, display_mode, page|
  elementDisplayed = display_mode =='displayed'? true : false
  case page
      when 'View Ideas'
        @mainpage.scrollBottomWidget('View Ideas')
        @viewideaspage.verifyIdeaExistsOnViewIdeas(@mainpage.getIdeaTitle(idea), elementDisplayed)
      when 'Activity' then
        ideaTitle = @mainpage.getIdeaTitle(idea)
        idea_title_xpath = ".//ul[@id='activitystream']//div[@class='media-body']/p[@class='sp-idea-details']/a[text()='#{ideaTitle}']"
        scroll_counter = 0
        while has_no_xpath?(idea_title_xpath) and scroll_counter < 5 do
          @mainpage.scrollDownWidget 'Activity Stream Widget'
          scroll_counter += 1
        end
        has_xpath?(".//ul[@id='activitystream']//div[@class='media-body']/p[@class='sp-idea-details']/a[text()='#{ideaTitle}']").should eq(elementDisplayed)
    when 'Idea Popup' then
      ideaTitle = @mainpage.getIdeaTitle(idea)
      has_xpath?(".//*[@id='ideaDetailsDialog']//a[text()='#{ideaTitle}']").should eq(elementDisplayed)

    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

Then(/^I verify "([^"]*)" file (.*) displayed in "([^"]*)" widget on "([^"]*)" page$/) do |filename, displayed,widget,page|
  file_name = filename[/[^\\\/:*?"<>|\r\n]+$/]
  is_displayed = displayed == 'is' ? true : false
  case page
    when 'Activity' then
      @activitypage.verifyElementExistsWithText(widget,filename)
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

Then(/^I verify that "([^"]*)" idea is "([^"]*)" in "([^"]*)" widget in "([^"]*)" page$/) do |idea, display_mode, widget, page|
  elementDisplayed = display_mode =='displayed'? true : false
  ideaTitle = @mainpage.getIdeaTitle(idea)
  case page
    when 'Innovation Market' then
      @innovationmarketpage.verifyElementExistsWithText(widget, idea).should eq(elementDisplayed)
    when 'Leaderboard' then
      @leaderboardpage.verifyElementExistsWithText(widget, ideaTitle).should eq(elementDisplayed)
    when 'Dashboard','Pairwise' then
      @administrationpage.verifyElementExistsWithText(widget, ideaTitle).should eq(elementDisplayed)
    when 'Activity' then
      @activitypage.verifyElementExistsWithText(widget, ideaTitle).should eq(elementDisplayed)
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

And(/^I click on the "([^"]*)" link on "([^"]*)" widget in "([^"]*)" page$/) do |link, widget, page|
  case page
    when 'Innovation Market' then
      @innovationmarketpage.clickLinkInList(widget, link)
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

Then(/^I verify "([^"]*)" popup confirmation message is displayed$/) do |message|
  sleep 2
  page.driver.browser.switch_to.alert.text.include?(message).should eq(true)
end

Then(/^I verify "([^"]*)" user "([^"]*)" a "([^"]*)" email notification due to "([^"]*)" idea for "([^"]*)" task using "([^"]*)" template$/) do |user, receive_mode, email, idea, task,evaluation_template|
  sleep 10
  emailExpected = receive_mode =='received'? true : false
  emailacc = @users.getUser(user,'email')
  emailpsw = @users.getUser(user,'emailpsw')
  match = emailacc[/\+(.*?)@/m]
  emailacc = emailacc.gsub(match,'@') unless match.nil? #retrieving mail w/o alias

  case email
    when 'Task Assignment Notice Idea Subscribers' then
      subject = "New task added to '#{@mainpage.getIdeaTitle(idea)}'."
      case task
        when 'General Review', 'Review' then
          @taskName = @generalreview.getReviewTemplate(evaluation_template)
        when 'Evaluation Form' then
          @taskName = @evaluations.getEvaluation(@mainpage.getCurrentSite, evaluation_template)
        when 'Evaluation File' then
          @taskName = @evaluations.getEvaluation(@mainpage.getCurrentSite, evaluation_template)
        when 'Approval','Request Feedback' then
          @taskName = task
        else
          fail(ArgumentError.new("'#{task}' is not listed!"))
      end
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, subject,'Task: ' + @taskName)
    else
      fail(ArgumentError.new("'#{email}' is not listed!"))
  end

  if emailExpected and @inboxemails == 0
    fail(ArgumentError.new("No '#{subject}' email was received!"))
  elsif !emailExpected and @inboxemails>0
    fail(ArgumentError.new("'#{subject}' email was received!"))
  end
end

Then(/^I verify "([^"]*)" user "([^"]*)" a "([^"]*)" email notification due to "([^"]*)" idea$/) do |user, receive_mode, notification, idea|
  sleep 10
  emailExpected = receive_mode =='received'? true : false
  ideaTitle = @mainpage.getIdeaTitle(idea)
  emailacc = @users.getUser(user,'email')
  emailpsw = @users.getUser(user,'emailpsw')
  match = emailacc[/\+(.*?)@/m]
  emailacc = emailacc.gsub(match,'@') unless match.nil? #retrieving mail w/o alias

  case notification
    when 'Notice to Subscribers [Idea]' then
      @subject = "[Idea] #{ideaTitle}"
      site = @communities.getCommunityUrl(@mainpage.getCurrentSite).gsub('/User/Login','')
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, @subject, site)

    when 'Notice to Subscribers [Comment]' then
      @subject = "[Comment] Re: #{ideaTitle}"
      site = @communities.getCommunityUrl(@mainpage.getCurrentSite).gsub('/User/Login','')
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, @subject, site)

    when 'Notice to Subscribers [Reply]' then
      @subject = "[Reply] Re: #{ideaTitle}"
      site = @communities.getCommunityUrl(@mainpage.getCurrentSite).gsub('/User/Login','')
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, @subject, site)

    when 'New Category Forum Comment Notification' then
      @subject = "[Category Thread] #{idea}"
      site = @communities.getCommunityUrl(@mainpage.getCurrentSite).gsub('/User/Login','')
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, @subject, site)

    when 'Task Assignment Notice Idea Subscribers' then
      @subject = "New task added to '#{idea}'"
      site = @communities.getCommunityUrl(@mainpage.getCurrentSite).gsub('/User/Login','')
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, @subject, site)

    when 'Content Marked as Spam Notice' then
      @subject = "[Idea] #{@mainpage.getIdeaTitle(idea)}"
      site = @communities.getCommunityUrl(@mainpage.getCurrentSite).gsub('/User/Login','')
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, @subject,site)

    when 'Report Abuse' then
      @subject = "Post Reported: #{@mainpage.getIdeaTitle(idea)}"
      @content = "Reason for Reporting:"
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, @subject,@content)

    when 'Report Abuse-Comment' then
      @subject = "Post Reported: Re: #{@mainpage.getIdeaTitle(idea)} #{@mainpage.getIdeaTitle(idea)}"
      @content = "Reason for Reporting:"
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, @subject,@content)

    when 'Report Abuse-Reply' then
      @subject = "Post Reported: Re: #{@mainpage.getIdeaTitle(idea)} Re: #{@mainpage.getIdeaTitle(idea)} #{@mainpage.getIdeaTitle(idea)}"
      @content = "Reason for Reporting:"
      @inboxemails = @mainpage.getNumberEmailsByContent(emailacc, emailpsw, @subject,@content)

    else
      fail(ArgumentError.new("'#{notification}' notification doesn't exist!"))
  end
  if emailExpected and @inboxemails == 0
    fail(ArgumentError.new("No '#{@subject}' email was received!"))
  elsif !emailExpected and @inboxemails>0
    fail(ArgumentError.new("'#{@subject}' email was received!"))
  end
end

# to vote on an idea with up/down or star rating
Then(/^I vote on the idea$/) do
  if has_xpath?(".//div[@class='user-interaction']")
      within(:xpath, ".//div[@class='user-interaction']") do
        vote = rand(1..2)
        find(:xpath, ".//ul/li[#{vote}]/a").click
      end
    elsif has_xpath?(".//div[@class='star-rating-wrapper']")
      within(:xpath, ".//div[@class='star-rating-wrapper']") do
        no_stars = all(:xpath, ".//div[@class='ui-stars-star']").count
        vote = rand(1..no_stars)
        find(:xpath, ".//div[@class='ui-stars-star'][#{vote}]/a").click
      end
    else
      fail(ArgumentError.new('Voting is not enabled!'))
    end
end

When(/^I navigate to "([^"]*)" user's profile page$/) do |user|
  userID = @users.getUser(user, 'id')
  url = @communities.getCommunityUrl(@mainpage.getCurrentSite)
  url = url.gsub(url[/.*spigit.com(.*)/,1],'')
  visit("#{url}/Page/UserProfile?userid=#{userID}")
  sleep 3
end

And(/^I scroll down till the bottom of the "([^"]*)" widget$/) do |widget|
  case widget
    when 'Activity Stream','My Ideas' then
      @activitypage.scrollBottomWidget(widget)
    when 'Activity' then
      @ideapopuppage.scrollBottomWidget(widget)
    else
      fail(ArgumentError.new("'#{widget}' is not listed!"))
  end
end

Then(/^I close the popup message$/) do
  message_path = ".//div[contains(@class,'popup-notice')]/a[contains(@class,'close')]"
  @util.waitForElement('xpath', message_path,5)
  find(:xpath, message_path).click
  sleep 1
end

When(/^I filter feeds using "([^"]*)" filter in "([^"]*)" section$/) do |feed_filter, section|
  @activitypage.clickLink(section)
  @activitypage.clickLink('Show Filters')
  @activitypage.selectOption('Feed Type', feed_filter)
  @util.waitForElement('xpath', $xpath_verify_activitystream,20)
end

Then(/^I verify "([^"]*)" is not displayed on "([^"]*)" page$/) do |setting, page|
  case page
    when 'Permissions Settings' then
      within @permissionsettingspage.permissions_form do
        has_text?(setting).should eq(false)
      end
    else
      fail(ArgumentError.new("'#{page}' page is not listed!"))
  end
end

And(/^I click on the "([^"]*)" button on the "([^"]*)" popup$/) do |button, popup|
  case popup
    when 'Close Idea' then
      within @viewideapage.closeidea_container do
        find(:xpath, ".//a[contains(.,'#{button}')]").click
      end
    when 'Terms and Conditions' then
      find(:xpath, ".//div[@aria-describedby='termsAndConditionsDialog']//span[text()='#{button}']").click
      sleep 5
    when 'Move this Idea','Report Abuse' then
      @viewideapage.clickButton button
    when 'Template Info' then
       within(:xpath, ".//*[@id='infoDialog']/div[@class='dialogContentWrapper']") do
         find(:xpath,".//a/span[text()='#{button}']").click
       end
    when 'Summary Popup' then
      @challengespage.clickButton button
    when 'Idea Tasks' then
      find(:xpath,".//span[contains(text(),'#{button}')]").click
    when 'Task' then
      within @taskspage.taskdialog_container do
        @taskspage.clickButton(button)
      end
    else
      fail(ArgumentError.new("'#{popup}' is not listed!"))
  end
  sleep 2 #DELETE ONCE ENG-6809 IS FIXED
  step "I refresh the current page" #DELETE ONCE ENG-6809 IS FIXED
end

And(/^I (.*) category\(ies\) "([^"]*)" to "([^"]*)" Moderator$/) do |action, categories, moderator|
  checked = action == 'add' ? true : false
  username = @users.getUser(moderator, 'username')
  @homepage.clickLink('Administration')
  @administrationpage.clickLink('Moderators')
  categories.split(',').each do |category|
    if category == 'All'
      all(:xpath, ".//table[@class='dashtable']//table/tbody[.//a[contains(.,'#{username}')]]//td[contains(@class,'cat')]/input").each do|cat_element|
        cat_element.click unless cat_element.checked? == checked
      end
    else
      cat_element = find(:xpath,".//table[@class='dashtable']//table/tbody[.//a[contains(.,'#{username}')]]//td[contains(@class,'cat') and contains(text(),'#{@mainpage.getCategoryTitle(category)}')]/input")
      cat_element.click unless cat_element.checked? == checked
    end
  end
  find(:xpath, ".//table[@class='dashtable']//table/tbody[.//a[contains(.,'#{username}')]]//a[@title='Update']").click
  sleep 3
end

And(/^I verify the 'Idea Popup' with the "([^"]*)" idea is displayed$/) do |idea|
  ideaTitle = @mainpage.getIdeaTitle(idea)
  within @ideapopuppage.ideapopup_container do
    fail(ArgumentError.new("Idea Popup isn't displayed for '#{ideaTitle}' idea!")) unless has_xpath?(".//div[@class='title' and a[text()='#{ideaTitle}']]")
  end
end

Then(/^I add (.*) text to "([^"]*)" textarea in "([^"]*)" page$/) do |content, field, page|
  case page
    when 'Email Templates' then
      @emailtemplatespage.fillInTinyMCEWithoutDeleteContent(field, content)
    else
      fail(ArgumentError.new("'#{page}' page is not listed."))
  end
end

Then(/^I verify "([^"]*)" alert message is displayed$/) do |message|
  alert = @util.alert_present?
  if alert.nil?
    fail(ArgumentError.new("No alert found!"))
  else
    alert.text.should eq(message)
  end
end

When(/^I "([^"]*)" the SuperAdmin role to "([^"]*)"$/) do |action, user|
  @homepage.clickLink('Administration')
  @administrationpage.clickLink('Users')
  @userspage.fillValue('Search Users', @users.getUser(user, 'username'))
  @userspage.clickButton('Search')
  @userspage.clickUserFromUserList @users.getUser(user, 'username')
  @userspage.setCheckbox('SuperAdmin', (action == 'assign'))
  @userspage.clickButton('Update')
  sleep 1
end

And(/^I verify that error popup message is not displayed$/) do
  has_xpath?( ".//div[contains(@class,'popup-notice')]").should eq(false)
end

Then(/^I verify that "([^"]*)" value is "([^"]*)" for "([^"]*)" idea's "([^"]*)" field in "([^"]*)" page$/) do |value, display_option, idea, field, page|
  display = display_option =='displayed'? true : false
  case page
    when 'Idea Popup' then
      within(:xpath,".//div[@id='ideaDetails']") do
        case field
          when 'Rich Text Editor'then
            has_xpath?(".//p[contains(text(),'#{field}')]/following-sibling::p[contains(text(),'#{value}')]").should eq(display)
          when 'Date Field' then
            has_xpath?(".//p[text()='#{field}: #{@util.getCurrentdate}']").should eq(display)
          when 'User With Autosuggest' then
            has_xpath?(".//p[text()='#{field}: #{@users.getUser(value, 'username')}']").should eq(display)
          else
            has_xpath?(".//p[text()='#{field}: #{value}']").should eq(display)
        end
      end
    when "View Idea" then

      within(:xpath,".//div[@class='idea-detail-content']") do
        case field
          when 'Rich Text Editor'then
            has_xpath?(".//p[contains(text(),'#{field}')]/following-sibling::p[contains(text(),'#{value}')]").should eq(display)
          when 'Date Field' then
            has_xpath?(".//p[text()='#{field}: #{@util.getCurrentdate}']").should eq(display)
          when 'User With Autosuggest' then
            has_xpath?(".//p[text()='#{field}: #{@users.getUser(value, 'username')}']").should eq(display)
          else
            has_xpath?(".//p[text()='#{field}: #{value}']").should eq(display)
        end

      end
    when "View Ideas" then
      within(:xpath,".//*[@id='viewIdeasViewPort']") do
        case field
          when 'Date Field' then
            has_xpath?(".//li[div[contains(.,'#{field}: #{@util.getCurrentdate}')]][div[contains(.,'#{@mainpage.getIdeaTitle(idea)}')]]").should eq(display)
          when 'Rich Text Editor'then
            hasField = has_xpath?(".//li[div[contains(.,'#{field}')]][div[contains(.,'#{@mainpage.getIdeaTitle(idea)}')]]")
            hasFieldValue = has_xpath?(".//li[div[contains(.,'#{value}')]][div[contains(.,'#{@mainpage.getIdeaTitle(idea)}')]]")
            (hasField && hasFieldValue).should eq(display)
          when 'User With Autosuggest' then
            has_xpath?(".//li[div[contains(.,'#{field}: #{@users.getUser(value, 'username')}')]][div[contains(.,'#{@mainpage.getIdeaTitle(idea)}')]]").should eq(display)
          else
            has_xpath?(".//li[div[contains(.,'#{field}: #{value}')]][div[contains(.,'#{@mainpage.getIdeaTitle(idea)}')]]").should eq(display)
        end
      end

  end
end

When(/^I navigate to the previous page$/) do
  driver = page.driver.browser
  driver.navigate.back
  sleep 2
end

And(/^I click on the "([^"]*)" category link of "([^"]*)" idea in "([^"]*)" page$/) do |category, idea, page|
  case page
    when 'View Ideas' then
      @viewideaspage.clickIdeaCategoryLink(idea,category)
    else
      fail(ArgumentError.new("'#{page}' page is not listed!"))
  end
end

And(/^I verify the "([^"]*)" button is (.*) on "([^"]*)" popup message$/) do |button, enabled, popup|
  is_enabled = enabled == 'enabled'
  case popup
    when 'Terms and Conditions'
      buttonclass = button == "Accept"? "btnAcceptTC":"btnRejectTC"
      unless has_xpath?(".//div[@aria-describedby='termsAndConditionsDialog']//a[contains(@class,'#{buttonclass} disabled')]").should eq(!is_enabled)
        fail(ArgumentError.new("'#{button}' button is not #{enabled}!"))
      end
    else
      fail(ArgumentError.new("'#{popup}' popup is not listed!"))
  end
end

And(/^I set "([^"]*)" checkbox to "([^"]*)" value on "([^"]*)" popup$/) do |checkbox, value, popup|
  boolValue = value =='true'? true : false
  case popup
    when 'Terms and Conditions' then
      case checkbox
          when 'Checking the box shows that you agree with the above terms'
            find(:xpath, ".//div[@aria-describedby='termsAndConditionsDialog']//*[@class='inputAccetpTC']").set boolValue
        else
          fail(ArgumentError.new("'#{checkbox}' checkbox is not listed on #{popup} popup."))
      end
    else
      fail(ArgumentError.new("'#{popup}' popup is not listed."))
  end
  sleep 0.5
end

Then(/^I verify the "([^"]*)" page is displayed$/) do |page|
  case page

    when 'puppies' then
      displayed = has_xpath? ".//*[contains(@href,'puppies') and text()='Images for puppies']"
      fail(ArgumentError.new('The result of puppies is not displayed!')) unless displayed

      #get a new xpath
    when 'cookies' then
      displayed = has_xpath? ".//span[@class='metabar__term'][contains(text(), 'cookies')]"
      fail(ArgumentError.new('The result of cookies is not displayed!')) unless displayed

      #get a new xpath
    when 'ice cream' then
      displayed = has_xpath? ".//a[contains(@href,'ice%20cream')]"
      fail(ArgumentError.new('The result of ice cream is not displayed!')) unless displayed

    when 'FB Home' then
      displayed = has_xpath? ".//a[@class='fbxWelcomeBoxBlock fbxWelcomeBoxSmallLeft fbxWelcomeBoxProfilePicBlock _8o _8r lfloat _ohe']"
      fail(ArgumentError.new('The Facebook home page is not displayed!')) unless displayed

    when 'Gmail Home' then
      fail(ArgumentError.new('The Gmail home page is not displayed!')) unless
          current_url.include?('/#inbox')

    when 'LI Home' then
      fail(ArgumentError.new('The Forgot Username page is not displayed!')) unless
          current_url.include?('/nhome/')

    when 'Change Password' then
      sleep 2
      displayed = has_xpath? ".//*[contains(text(),'Change Password')]"
      fail(ArgumentError.new('The change password page is not displayed!')) unless displayed
    when 'Terms and Conditions' then
      sleep 2
      displayed = has_xpath? ".//*[@id='AdditionalTermsForm']"
      fail(ArgumentError.new('The Terms and Conditions page is not displayed!')) unless displayed
    when 'Forgot Username' then
      fail(ArgumentError.new('The Forgot Username page is not displayed!')) unless
          current_url.include?('User/Reset?action=username') or current_url.include?('/forgot/username')
    when 'Forgot Password' then
      fail(ArgumentError.new('The Forgot Password page is not displayed!')) unless
          current_url.include?('User/Reset?action=password') or current_url.include?('/forgot/password')
    when 'Reset Password' then
      sleep 2
      fail(ArgumentError.new('The Reset Password page is not displayed!')) unless
          current_url.include?('User/Reset?action=validateUserConfNum&conf_num=') or (current_url.include?('/login/reset') and has_css?('.reset-container'))
    when 'Home' then
      sleep 2
      fail(ArgumentError.new('The Home page is not displayed!')) unless current_url.include?('Page/Home')
    when 'User Profile' then
      sleep 1
      fail(ArgumentError.new('The User Profile page is not displayed!')) unless current_url.include?('Page/UserProfile?userid=')
    when 'View Ideas' then
      sleep 2
      fail(ArgumentError.new('View Ideas page was not displayed!')) unless current_url.include?('/Page/ViewIdeas')
    when 'Close Idea' then
      fail(ArgumentError.new('The Close Idea page is not displayed!')) unless current_url.include?('/Idea/CloseIdea?ideaid=')
    when 'My Profile' then
      @util.waitForElement('xpath',".//*[@id='profile-vcard']",8)
    when 'Change Subscription Notification Status' then
      fail(ArgumentError.new('Subscriptions page is not displayed!')) unless (current_url.include?('/Page/Unsubscribe') and has_xpath?(".//h3[text()='#{page}']"))
    when 'Product Version Information' then
      fail(ArgumentError.new('Product Version Information page is not displayed!')) unless (current_url.include?('/Page/VersionInfo') and has_xpath?(".//a[text()='#{page}']"))
    when 'Recent Blog entries' then
      fail(ArgumentError.new('Product Version Information page is not displayed!')) unless (current_url.include?('/Page/ViewBlog?blogid') and has_xpath?(".//h2[contains(.,'#{page}')]"))
    when 'Auction' then
      fail(ArgumentError.new('Auction page is not displayed!')) unless current_url.include?('/Page/Store/Auction?')
    when 'View Idea' then
      fail(ArgumentError.new("'View Idea' page is not displayed!")) unless current_url.include?('/Page/ViewIdea?')
    when 'Add User' then
      sleep 2
      fail(ArgumentError.new("'Add Usea' page is not displayed!")) unless current_url.include?('/Admin/Dashboard?orig_url=%2FPage%2FAddUser%3Fpagename%3Dadduser')
    when 'Sign In/Register' then
      fail(ArgumentError.new("'Sign In/Register' page is not displayed!")) unless current_url.include?('/User/Login?orig_url=/Page/PostIdea')
    when 'Activity' then
      fail(ArgumentError.new("'Activity' page is not displayed!")) unless current_url.include?('/Page/ActivityStream')
    when 'Sign In' then
      fail(ArgumentError.new("The Sign In page is not displayed!")) unless (current_url.include?('/User/Login') and has_css?('.signin-container'))
    when 'Post Idea' then
      fail(ArgumentError.new("The 'Post Idea' page is not displayed!")) unless (current_url.include?('/Page/PostIdea') and has_css?('#postideaform'))
    when 'Administration>User' then
      sleep 2
      fail(ArgumentError.new('THE USER PAGE WAS NOT DISPLAYED!')) unless current_url.include?('/Admin/Dashboard?orig_url=%2FPage%2FUserAdmin')
    when 'DPA' then
      fail(ArgumentError.new("The 'DPA' page is not displayed!")) unless (current_url.include?('Admin/Dashboard?orig_url=%2FAdmin%2FConfiguration%3Fsection%3DdevProductsAccess'))
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

And(/^I hover the mouse over "([^"]*)" element on "([^"]*)" page$/) do |element, page|
  current_element = nil
  case page
    when 'View Idea' then
      current_element = @viewideapage.getElement(element)
    when 'My Profile' then
      current_element = find(:xpath, ".//*[@id='profile-vcard']//*[contains(@class,'avatarImage')]")
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
  current_element.hover
end

And(/^I verify that "([^"]*)" element on "([^"]*)" page is (.*)$/) do |element, page, editable|
  is_editable = editable == 'editable'
  case page
    when 'Administration', 'Email Users' then
      case element
        when 'Sender Email'
          has_xpath?(".//*[@id='emailMembers']//td/input[@id='sender' and @disabled]")
        else
          fail(ArgumentError.new("Element '#{element}' is not listed!"))
      end
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

And(/^I fill in the "([^"]*)" field with "([^"]*)" values from "([^"]*)" user\(s\) on "([^"]*)" page$/) do |element, user_field, users, page|
  value = ''
  userslist = users.split(",")
  userslist.each do |user|
    value = (value==''?'':value + ",") + @users.getUser(user,user_field)
  end
  step "I fill in the \"#{element}\" field with \"#{value}\" value on \"#{page}\" page"
end

And(/^I verify "([^"]*)" user received a "([^"]*)" email notification with "([^"]*)" content$/) do |user, subject, content|
  emailacc = @users.getUser(user,'email')
  emailpsw = @users.getUser(user,'emailpsw')
  match = emailacc[/\+(.*?)@/m]
  emailacc = emailacc.gsub(match,'@') unless match.nil? #retrieving mail w/o alias
  unless @util.mailHasContent(emailacc, emailpsw, subject, content, false)
    fail(ArgumentError.new("No content in email notification!"))
  end
end

And(/^I verify "([^"]*)" option is selected in "([^"]*)" list on "([^"]*)" page$/) do |option, list, page|
  case page
    when 'Permission Settings' then
      @permissionsettingspage.verifySelectedOption(option,list)
    else
      fail(ArgumentError.new("'#{page}' is not listed."))
  end
end

And(/^I verify that "([^"]*)" fields on "([^"]*)" page are "([^"]*)"$/) do |container, page, empty|
  is_empty = empty == 'empty'
  case page
    when 'Idea Management' then
      @ideamanagementpage.verifyFieldsContent(container,is_empty)
    else
      fail(ArgumentError.new("'#{page}' is not listed."))
  end
end

Then(/^I verify that "([^"]*)" idea is (.*) in "([^"]*)" section on 'My Inbox' popup$/) do |title, displayed, section|
  is_displayed = displayed == "displayed"
  visible = displayed == "displayed"?"not visible":"visible"
  idea_title = @mainpage.getIdeaTitle(title)
  case section
    when 'My Notifications'
      @myinboxpage.scrollBottomWidget(section)
      all(:xpath, ".//*[@id='notificationsLists']//a[@class='action_IdeaDetails']").each do |notification|
        fail(ArgumentError.new("the idea \"#{idea_title}\" is #{visible} on '#{section}' section!")) unless (notification.value == idea_title) == is_displayed
      end
    when 'Messages'
      sleep 2
      all(:xpath, ".//ul[@id='conversationLists']/li/div[div[@class='media-heading'] and div[@class='conversation-text']]").each do |conversation|
        conversation.click
        sleep 3
        all(:xpath, ".//ul[@id='privateMessageLists']/li/div[@class='media-body']//a[@class ='action_IdeaDetails']") do |idea|
          fail(ArgumentError.new("the idea \"#{idea_title}\" is #{visible} on '#{section}' section!")) unless (idea.value == idea_title) == is_displayed
        end
      end
    when 'Tasks' then
      sleep 3
      if is_displayed and has_xpath?(".//div[@id='loadMyTasks']//div[contains(@class,'no-results')]")
        fail(ArgumentError.new("the idea \"#{idea_title}\" is not visible on '#{section}' section!"))
      else
        @util.waitForElement('css', '#taskLists>li', 14)
        all(:xpath, ".//ul[@id='taskLists']//li").each do|task_listed|
          task_listed.click
          sleep 1
          current_idea = find(:xpath, ".//*[@id='taskDetails']/li[div[span[text()='Idea Title']]]/div[2]/a").value
          fail(ArgumentError.new("the idea \"#{idea_title}\" is #{visible} on '#{section}' section!")) unless (current_idea == idea_title) == is_displayed
        end
      end
  end
end

Then(/^I verify that "([^"]*)" (.*) is "([^"]*)" on "([^"]*)" page$/) do |element, _, displaying_option, page|
  step "I verify that \"#{element}\" element is \"#{displaying_option}\" in \"#{page}\" page"
end

And(/^I update the site's title to "([^"]*)"$/) do |new_title|
  @homepage.clickLink('Administration')
  @administrationpage.clickLink('Site Themes and Access Settings')
  @createcommunitypage.fillValue('Community Title', new_title)
  @createcommunitypage.clickButton('Update')
  @communities.addCommunityInfo(@mainpage.getCurrentSite,'title',new_title)
end

Given(/^I navigate to the external "([^"]*)" site$/) do |site|
  @mainpage.setPageUrl(@URL.getUrl(site))
  @mainpage.setCurrentSite(site)
end

When(/^I fill in the "([^"]*)" field with "([^"]*)" value$/) do |arg1, value|
  @mainpage.fill_value(arg1, value)
end

When(/^I login with the given "([^"]*)"$/) do |user|
  @loginpage.fillValue('Email', @users.getUser(user, 'email'))

  next_button_exists = has_xpath? ".//*[@id='next']"
  if next_button_exists
    @loginpage.clickButton('Next')
    @loginpage.fillValue('Password', @users.getUser(user, 'password'))
  end
  @loginpage.fillValue('Password', @users.getUser(user, 'password'))
  @loginpage.clickButton('Sign In')

  @mainpage.setCurrentUser(user)
end