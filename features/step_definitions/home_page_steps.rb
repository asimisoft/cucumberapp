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
