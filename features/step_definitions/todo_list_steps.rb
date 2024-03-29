Given /^I am on the home page$/ do
  visit root_url
end

When /^I click the "([^"]*)" link$/ do |page|
  click_link page
end

When /^fill out the list details$/ do
  @name = Faker::HipsterIpsum.word
  fill_in 'Name', :with => @name
end

When /^click the "([^"]*)" button$/ do |button|
  click_button button
end

Then /^my new list should be created$/ do
  TodoList.where(:name => @name).count.should == 1
end

Then /^I should be on the show page for my list$/ do
  pending
  current_path.should == todo_list_path(TodoList.find_by_name(@name))
end

