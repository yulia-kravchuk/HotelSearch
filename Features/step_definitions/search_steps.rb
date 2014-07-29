Given(/^I start typing city name "([^"]*)"$/) do |term|
  @driver.find_element(:id, "js_querystring").clear
  @driver.find_element(:id, "js_querystring").send_keys "#{term}"
  @driver.find_element(:xpath, ".//*[@id='js_suggest']/ul/li[1]").click
end

Then(/^the list of city suggestions starts from "([^"]*)"$/) do |arg|
  pending
end

Given /^I search for a hotel in "([^"]*)"$/ do |city|
  pending
end

Then(/^the calendar of the search form is closed$/) do
  pending
end

And(/^the hotel result list is displayed$/) do
  pending
end

And(/^I select the "([^"]*)" hotel in the list$/) do |arg|
  pending
end

When(/^I select the "([^"]*)" deal$/) do |arg|
  pending
end

Then(/^the hotel name is available on the partners website$/) do
  pending
end

And(/^I select dates of my stay$/) do
  pending
end

When(/^I click search$/) do
  pending
end