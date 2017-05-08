Given(/^I am on Google$/) do
	@google = GoogleSearch.new(@browser)
	@google.visit
end

When(/^I search "([^"]*)"$/) do |keyword|
  @google.search_for keyword
end

Then(/^I should see title "([^"]*)"$/) do |title|
  expect(@google.get_title).to eq title
end