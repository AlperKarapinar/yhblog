Feature: Manage posts
  In order to posts in main page
  As an author
  I wants create and manage posts
  
  Scenario: List all post
    Given I have posts titled Rails, Linux
    When I go to home page
    Then I should see Rails
    And I should see Linux  
  
  Scenario: Create new post
    Given I am on the new post page
    When I fill in "Title" with "title 1"
    And I fill in "Body" with "body 1"
    And I uncheck "Published"
    And I press "Create"
    Then I should see "title 1"
    And I should see "body 1"
    And I should see "false"

  Scenario: Delete post
    Given the following posts:
      |title|body|published|
      |title 1|body 1|false|
      |title 2|body 2|true|
      |title 3|body 3|false|
      |title 4|body 4|true|
    When I delete the 3rd post
    Then I should see the following posts:
      |Title|Body|Published|
      |title 1|body 1|false|
      |title 2|body 2|true|
      |title 4|body 4|true|
