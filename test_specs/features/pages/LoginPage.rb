require 'capybara/rspec'

class LoginPage < SitePrism::Page

  element :email_field, :xpath, ".//*[@id='Email' or @id='email' or @id='login-email']"
  element :password_field, :xpath, ".//*[@id='Passwd' or @id='pass' or @id='login-password']"
  element :next_button, :xpath, ".//*[@id='next']"
  element :signin_button, :xpath, ".//*[@id='signIn' or @id='loginbutton' or @value='Sign in']"

  #Facebook Specific
  element :new_email_field, :xpath, ".//*[@id='u_0_6']"
  element :new_email_field_repeat, :xpath, ".//*[@id='u_0_9']"
  element :new_password_field, :xpath, ".//*[@id='u_0_b']"
  element :first_name, :xpath, ".//*[@id='u_0_1']"
  element :last_name, :xpath, ".//*[@id='u_0_3']"
  element :sign_up, :xpath, ".//*[@id='u_0_j']"

  def fillValue(field, value)
    @users = Users.new
    case field
      when 'Email' then
        email_field.set value
      when 'New Email' then
        new_email_field.set value
      when 'New Email Repeat' then
        new_email_field_repeat.set value
      when 'Password' then
        password_field.set value
      when 'New Password' then
        new_password_field.set value
      when 'First Name' then
        first_name.set value
      when 'Last Name' then
        last_name.set value
      else
        fail(ArgumentError.new("'#{field}' field is not listed!"))
    end
    sleep 0.5
  end

  def clickButton(button)
    case button
      when 'Sign In' then
        signin_button.click
        sleep 1
      when 'Next' then
        next_button.click
        sleep 1
      when 'Sign Up' then
        sign_up.click
        sleep 1
      else
        fail(ArgumentError.new("'#{button}' button is not listed!"))
    end
  end

end