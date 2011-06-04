Given /^I have posts titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Post.create!(:title => title)
  end
end

When /^I go to home page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
