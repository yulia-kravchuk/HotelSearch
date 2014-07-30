

#define instantiateBrowser
#Firefox browser instantiation
#driver = Selenium::WebDriver.for :firefox

#end

#define navigateTo |url|
#Loading the assertselenium URL
#driver.navigate.to "http://trivago.com"
#end


=begin
describe "Untitled" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://www.trivago.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

  it "test_untitled" do
    @driver.get(@base_url + "/")
    @driver.find_element(:id, "js_querystring").clear
    @driver.find_element(:id, "js_querystring").send_keys "Hambur"
    @driver.find_element(:css, "span.ssg_info").click
    @driver.find_element(:link, "29").click
    @driver.find_element(:link, "7").click
    @driver.find_element(:id, "js_go").click
  end

  def element_present?(how, what)
    ${receiver}.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?()
    ${receiver}.switch_to.alert
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
    alert = ${receiver}.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end

  end

=end

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

end

def select_city(city, country)
  type_city_name(city)
  select_city_from_dropdown(city, country)
end

