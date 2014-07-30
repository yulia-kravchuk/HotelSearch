require "bundler"
require "json"
require "selenium-webdriver"
require "rspec"
require "cucumber"
require "selenium"

include RSpec::Expectations

Before do
  start_browser
  navigate_to_home_page
end

After do
  close_browser
end
