Feature: Manage Posts
  In order to make a blog
  As an author
  I want to create and manage posts
  
  Scenario: Posts List
    Given I have posts titled Rails, Linux
    When I go to home page
    Then I should see "Rails"
    And I should see "Linux"
    
  