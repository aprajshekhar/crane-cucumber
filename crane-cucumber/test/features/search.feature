Feature: Tests the search functionality of Crane
Scenario: Test the search functionality
  Given Crane CI is up
  When I search for rhel
  Then I should get 200
  And the response should have the searched term