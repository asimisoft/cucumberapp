# require 'selenium-webdriver'

# driver = Selenium::WebDriver.for :firefox
# driver.navigate.to "http://localhost:3000/"

# wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
# driver.find_element(:id, 'link-test').click
# wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
# driver.quit

# Below are the working code for cucumber using capybara code
# uncomment below code to check cucumber feature
=begin
Given(/^I am on the home page$/) do
  visit root_path
end

Then(/I should see "([^"]*)"$/) do |name|
  # expect(page).to have_content name
  page.should have_content name
end

Then(/^I should see "([^"]*)" in the selector "([^"]*)"$/) do |txt, selector|
  page.should have_selector(selector), content: txt
end

Then(/^I should see "([^"]*)" in the link$/) do |text|
  page.should have_link text
end

Given(/^I am on the test page$/) do
  visit tests_path
end

Given(/^I am on "([^"]*)"$/) do |arg1|
  visit new_test_path
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |element, text|
  fill_in element, with: text, visible: false
end

When(/^I click "([^"]*)"$/) do |element|
  click_on element
  # click_button 'Save'
  # expect(page).to have_content "This is the home page List of the Tests"
end
=end

# **********************************************************
# selenium webdriver
# **********************************************************
# automation feature spec implementing using selenium-webdriver
=begin
require 'selenium-webdriver'
driver = Selenium::WebDriver.for :firefox

Given(/^I am on home page$/) do
  visit root_path
  expect(page).to have_current_path('/')
  page.should have_selector("h1"), content: "This is the home page"
  # page.should have_link ""
  driver.navigate.to "http://localhost:3000/"
  p "*******1*********"
end

When(/^Click on List of the tests$/) do
  p "*******2*********"
  driver.find_element(:id, 'link-test').click
  # visit tests_path
  # expect(page).to have_current_path(tests_path)

end

Then(/^It should open the tests listing page$/) do
  begin
          actual = URI.parse(current_url).path
          p "******3*********" + actual
          expected = tests_path
          p "******4*********" + expected
          wait_until { actual == expected }
          expect(page).to have_current_path(tests_path)
  ensure
    driver.quit
  end
end

def wait_until
  Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
end
=end

# **********************************************************
# watir webdriver
# **********************************************************
require 'watir-webdriver'
browser = Watir::Browser.new :firefox

Given(/^I am on home page$/) do
  visit root_path
  expect(page).to have_current_path('/')
  page.should have_selector("h1"), content: "This is the home page"
  browser.goto "http://localhost:3000/"
  p "*******1********* #{browser.url}"
end

When(/^Click on List of the tests$/) do
  p "*******2********* #{browser.url}"
  browser.a(id: 'link-test').click
end

Then(/^It should open the tests listing page$/) do
  begin
    actual = URI.parse(browser.url).path
    expected = tests_path
    expect(actual==expected).to be_truthy
  ensure
    browser.close
  end
end
