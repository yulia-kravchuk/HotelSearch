require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

#define instantiateBrowser
#Firefox browser instantiation
#driver = Selenium::WebDriver.for :firefox

#end

#define navigateTo |url|
#Loading the assertselenium URL
#driver.navigate.to "http://trivago.com"
#end


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

