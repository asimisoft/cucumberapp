require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://localhost:3000/"

wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
driver.find_element(:id, 'link-test').click
wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
driver.quit

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