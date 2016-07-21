require 'rubygems'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/node/matchers'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'rspec/matchers'
require 'site_prism'
require 'site_prism/waiter'
#require 'gmail'
#require 'forgery'
#require_relative 'sauce_setup'

=begin
is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)

if is_windows
  require 'win32/clipboard'
  include Win32
end
=end

# Browsers: IE, CH, FF
$browser = 'FF'

if ENV['TARGET'] == 'local'
  Capybara.default_driver = :selenium
  Capybara.javascript_driver = :webkit  #:chrome

  case $browser
    when 'CH' then
      Capybara.register_driver :chrome do |app|
        caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {'args' => [ '--disable-extensions' ]})
        Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => caps)
      end
      Capybara.default_driver = :chrome

    when 'IE' then
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
        # caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer({:requireWindowFocus => true, :enablePersistentHover => false})
        # Capybara::Selenium::Driver.new(app, :browser => :internet_explorer, :desired_capabilities => caps)
      end
      Capybara.default_driver = :selenium

    when 'FF' then
      Capybara.register_driver :selenium do |app|
        #Capybara::Selenium::Driver.new(app, :browser => :firefox)
        caps = Selenium::WebDriver::Remote::Capabilities.firefox(:unexpectedAlertBehaviour => 'ignore')
        Capybara::Selenium::Driver.new(app, :browser => :firefox, :desired_capabilities => caps)
      end
      Capybara.default_driver = :selenium
  end

else
  ENV['SAUCE_USERNAME']   = 'spigit_test'
  ENV['SAUCE_ACCESS_KEY'] = '78a2bcc7-1025-4bb0-96b2-82e647616e97'
# desired_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
# desired_capabilities.version = '45'
# desired_capabilities.platform = 'Windows 7'
# desired_capabilities[:name] = 'Testing Selenium with Ruby on Sauce'
# SimpleSauce.desired_capabilities = desired_capabilities

  Around do |scenario, block|
    block.call
    ::Capybara.current_session.driver.quit
  end

  Capybara.register_driver :light_sauce do |app|
    Capybara::Selenium::Driver.new( app, SimpleSauce.webdriver_config )
  end

  Capybara.default_driver = :light_sauce
  Capybara.javascript_driver = :light_sauce

  #Before '@sauce' do
  # Capybara.current_driver = :light_sauce
  #end
end

#Switch mode argument
$devmod = false

#Version
$version = 390
$versionUrl = "qa#{$version}automation"
$timezone_USA = 'PDT' #PST/PDT

Before do |scenario|
  puts "TC Start time: #{Time.now.strftime('%m/%d/%Y %H:%M%p')}"

  #region defined screen pages
  @mainpage = MainPage.new
  @URL = URL.new
  @loginpage = LoginPage.new
  @users = Users.new
  @communities = Communities.new
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
