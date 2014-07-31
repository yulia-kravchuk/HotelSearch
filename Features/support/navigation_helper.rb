def type_city_name(term)
  @driver.find_element(:id, "js_querystring").clear
  @driver.find_element(:id, "js_querystring").send_keys "#{term}"
end

def get_city_suggestions
  @driver.find_elements(:xpath, ".//*[@id='js_suggest']/ul/li").map do |element|
    [element.attribute('data-title').to_s, element.find_element(:class, "ssg_info").text]
  end
end

def select_city_from_dropdown(city, country)
  @driver.find_element(:xpath, ".//*[@data-title='#{city}']//*[contains(text(),'#{country}')]").click
  wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
  wait.until {false}
  rescue Selenium::WebDriver::Error::TimeOutError
end

def select_city(city, country)
  type_city_name(city)
  select_city_from_dropdown(city, country)
end

def select_date_from(date)
  @driver.find_element(:xpath, ".//*[@id='date_from']").click
  @driver.find_element(:xpath, ".//*[@data-date='#{date}' and not(contains(@class,'unselectable'))]").click
end

def select_date_to(date)
  @driver.find_element(:xpath, ".//*[@id='date_to']").click
  @driver.find_element(:xpath, ".//*[@data-date='#{date}' and not(contains(@class,'unselectable'))]").click
end

def close_calendar
  @driver.find_element(:xpath, ".//*[@id='calendar_breadcrumb']//*[contains(@class,'close_calendar')]").click
end

def calendar_open?
  not element_present?(:xpath, ".//*[@id='calendar_container']")
end

def click_search
  @driver.find_element(:xpath, ".//*[@id='js_go']").click
end

def hotel_list_displayed?
  element_present?(:xpath, ".//*[@id='js_itemlist']")
end

def select_hotel(number_in_list)
  @current_hotel = @driver.find_element(:xpath, ".//*[@id='js_itemlist']/li[#{number_in_list}]")
  @current_hotel.find_element(:xpath, ".//*[contains(@id,'js_button_deals')]").click
  @current_hotel_name = @current_hotel.find_element(:xpath, ".//*[contains(@id,'jsheadline')]").text.strip
end

def select_deal(number_in_list)
  @driver.find_element(:xpath, ".//*[contains(@class,'item_deals js_item_deal')][#{number_in_list}]").click
end

def name_is_on_website
  @driver.switch_to.window(@driver.window_handles.last)
  words = @current_hotel_name.split(" ").map { |s| "contains(text(),'#{s}') and " }
  @driver.find_element(:xpath, ".//*[#{words.join('').chomp(' and ')}]")
end




