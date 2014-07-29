require "bundler"
require "json"
require "selenium-webdriver"
require "rspec"
require "cucumber"
require "selenium"
require "addressable"
require "win64-service"


include RSpec::Expectations

Before do
  if @driver.nil?
    @driver = Selenium::WebDriver.for :firefox
  end
  @base_url = "http://www.trivago.com"
  @accept_next_alert = true
  @driver.manage.timeouts.implicit_wait = 30
  @verification_errors = []

  unless  @driver.current_url.eql?(@base_url)
    @driver.get(@base_url + "/")
  end
end

Kernel.at_exit do
  #@driver.quit
  @driver.browser.close
  @verification_errors.should == []
end