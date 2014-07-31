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

And(/^I select dates of my stay$/) do
  select_date_from((Date.today + 2).to_s)
  select_date_to((Date.today + 4).to_s)
  close_calendar
end

Then(/^the calendar of the search form is closed$/) do
  calendar_open?.should == false
end

When(/^I click search$/) do
  click_search
end

And(/^the hotel result list is displayed$/) do
  hotel_list_displayed?.should == true
end

And(/^I select the "([^"]*)" hotel in the list$/) do |number_in_list|
  select_hotel(number_in_list)
end

When(/^I select the "([^"]*)" deal$/) do |number_in_list|
  select_deal(number_in_list)
end

Then(/^the hotel name is available on the partners website$/) do
  name_is_on_website
end
