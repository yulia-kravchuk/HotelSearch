require "bundler"
require "json"
require "selenium-webdriver"
require "rspec"
require "cucumber"
require "selenium"

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

After do
  unless @driver.nil?
    @driver.quit
  end
  unless @verification_errors.nil? or @verification_errors.empty?
    puts "\n*********** Errors: #{@verification_errors.inspect}"
  end
end

Kernel.at_exit do
  unless @driver.nil?
    @driver.quit
  end
  unless @verification_errors.nil?
    puts "\n*********** Errors: #{@verification_errors.inspect}"
  end
end