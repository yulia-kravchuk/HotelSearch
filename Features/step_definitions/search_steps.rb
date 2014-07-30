Given(/^I start typing city name "([^"]*)"$/) do |term|
  type_city_name(term)
end

Then(/^the list of city suggestions starts from "([^"]*)" in "([^"]*)"$/) do |city, country|
  get_city_suggestions[0][0].should eql(city)
  get_city_suggestions[0][1].include?(country).should == true
end

Given /^I search for a hotel in "([^"]*)" city in "([^"]*)"$/ do |city, country|
  select_city(city, country)
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