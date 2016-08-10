require 'rubygems'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/node/matchers'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'rspec/matchers'
require 'site_prism'
require 'site_prism/waiter'
require 'gmail'
#require 'forgery'
#require_relative 'sauce_setup'

=begin
is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)

if is_windows
  require 'win32/clipboard'
  include Win32
end
=end

# Browsers: IE, CH, FF, SA
$browser = 'FF'

Capybara.default_driver = :selenium
Capybara.javascript_driver = :webkit  #:chrome
Capybara.default_max_wait_time = 10

case $browser
  when 'CH'
  then
    Capybara.register_driver :selenium do |app|
      # Capybara::Selenium::Driver.new(app, :browser => :chrome, :profile=> 'default')
      caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--disable-extensions" ]})
      Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => caps)
    end
    Capybara.default_driver = :selenium

  when 'IE'
  then
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
    end
    Capybara.default_driver = :selenium

  when 'FF'
  then
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :firefox)
    end
    Capybara.default_driver = :selenium

  when 'SA'
  then
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :safari)
    end
    Capybara.default_driver = :selenium

end

Before do |scenario|
  puts "TC Start time: #{Time.now.strftime('%m/%d/%Y %H:%M%p')}"

  #region defined screen pages
  @mainpage = MainPage.new
  @URL = URL.new
  @loginpage = LoginPage.new
  @users = Users.new
  @util = Util.new
end

After do |scenario|
  if scenario.failed?
    case scenario
      when Cucumber::Ast::OutlineTable::ExampleRow
        @scenario_name = scenario.scenario_outline.name
      when Cucumber::Ast::Scenario
        @scenario_name = scenario.name
      else
        raise('Unhandled class')
    end
    sw = page.driver.browser

    if $browser == 'CH' # resize browser to take full page screenshots
      width  = page.execute_script('return Math.max(document.body.scrollWidth, document.body.offsetWidth, document.documentElement.clientWidth, document.documentElement.scrollWidth, document.documentElement.offsetWidth);')
      height = page.execute_script('return Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight);')
      sw.manage.window.resize_to(width+100, height+100)
      sleep 0.2
    end
    encoded_img = sw.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}",'image/png')
    Dir::mkdir('output/screenshots') if not File.directory?('output/screenshots')
    screenshot = "output/screenshots/FAILED_#{@scenario_name.gsub(' ','_').gsub('|','_').gsub(/[^0-9A-Za-z_()]/, '')}_#{Time.new.strftime('%Y%m%d-%H%M%S')}.png"
    sw.save_screenshot(screenshot)
  end
end
