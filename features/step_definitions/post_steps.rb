Given /^I have posts titled (+,)$/ do |titles|
  titles.split(', ').each do |title|
    Post.create!(:title => title)
  end
end

Then /^I should see Rails$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see Linux$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^the following posts:$/ do |posts|
  Post.create!(posts.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) post$/ do |pos|
  visit posts_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following posts:$/ do |expected_posts_table|
  expected_posts_table.diff!(tableish('table tr', 'td,th'))
end
