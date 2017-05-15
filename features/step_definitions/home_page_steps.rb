Given(/^there is a post titled "(.*?)" $/) do |title|
  @test = create(:test, name: title)
end

Given(/^I am on the home page$/) do
  visit root_path
end

Then(/I should see "([^"]*)"$/) do |name|
  # expect(page).to have_content name
  page.should have_content name
end