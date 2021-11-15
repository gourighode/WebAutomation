Feature: Product Search

@sanity
Scenario: Valid Product Search
Given I am on Flipkart home page
When I perform product search with valid product name
Then I should see search results related to entered search criteria