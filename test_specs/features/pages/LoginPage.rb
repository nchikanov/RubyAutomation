require 'capybara/rspec'

class LoginPage < SitePrism::Page

  element :email_field, :xpath, ".//*[@id='Email' or @id='email' or @id='login-email']"
  element :password_field, :xpath, ".//*[@id='Passwd' or @id='pass' or @id='login-password']"
  element :next_button, :xpath, ".//*[@id='next']"
  element :signin_button, :xpath, ".//*[@id='signIn' or @id='loginbutton' or @value='Sign in']"

  def fillValue(field, value)
    @users = Users.new
    case field
      when 'Email' then
        email_field.set value
      when 'Password' then
        password_field.set value
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
      else
        fail(ArgumentError.new("'#{button}' button is not listed!"))
    end
  end

end