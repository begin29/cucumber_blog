Given(/^I have articles titled (.+)$/) do |titles|
  titles.split(', ').each do |title|
    Article.create!(title: title)
  end
end

When(/^I go to (.+)$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  Article.find_by_title("#{arg1}")
end

Given(/^I have no articles$/) do
  Article.delete_all
end

Given(/^I am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^I follow "(.*?)"$/) do |arg1|
  visit path_to arg1
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in "article[#{arg1.downcase}]", with: arg2
end

# TODO: doesn`t work click to submit
When(/^I press "(.*?)"$/) do |arg1|
  click arg1
end

Then(/^I should have ([0-9]+) articles?$/) do |count|
  Article.count.should == count.to_i
end

