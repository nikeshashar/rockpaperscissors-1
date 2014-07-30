When(/^I click "(.*?)"$/) do |button|
  click_on(button)
end

When(/^I enter my name$/) do
  fill_in "name", with: "Stephen"
end

Then(/^I should be ready to play$/) do
  expect(page).to have_content("Choose your weapon Stephen")
end

Given(/^I've registered to play$/) do
  visit '/new-game'
  click_button "Play!"
end

When(/^I choose Paper$/) do
  click_button('Paper')
end