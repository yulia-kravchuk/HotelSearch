def start_browser
  if @driver.nil?
    @driver = Selenium::WebDriver.for :firefox
  end
  @base_url = "http://www.trivago.com"
  @accept_next_alert = true
  @driver.manage.timeouts.implicit_wait = 30
  @verification_errors = []
end

def navigate_to_home_page
  unless  @driver.current_url.eql?(@base_url)
    @driver.get(@base_url + "/")
  end
end

def close_browser
  unless @driver.nil?
    @driver.quit
  end
  unless @verification_errors.nil? or @verification_errors.empty?
    puts "\n*********** Errors: #{@verification_errors.inspect}"
  end
end

def element_present?(how, what)
  @driver.find_element(how, what)
  true
rescue Selenium::WebDriver::Error::NoSuchElementError
  false
end

def alert_present?()
  @driver.switch_to.alert
  true
rescue Selenium::WebDriver::Error::NoAlertPresentError
  false
end

def verify(&blk)
  yield
rescue ExpectationNotMetError => ex
  @verification_errors << ex
end

def close_alert_and_get_its_text(how, what)
  alert = @driver.switch_to.alert
  alert_text = alert.text
  if @accept_next_alert then
    alert.accept
  else
    alert.dismiss
  end
  alert_text
ensure
  @accept_next_alert = true
end