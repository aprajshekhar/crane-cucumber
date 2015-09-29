Feature: Tests the repositories functionality
  Scenario: Test the repositories endpoint
    Given Crane CI is up
    When I retrieve list of repositories
    Then I should get 403

