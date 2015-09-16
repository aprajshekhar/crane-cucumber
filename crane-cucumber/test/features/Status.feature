Feature: Test status ping
  Scenario: Test the status of v1 endpoint
    Given Crane CI is up
    When I check the status of v1 endpoint
    Then I should get 200

  Scenario: Test the response of v1 endpoint
    Given Crane CI is up
    When I check the status of v1 endpoint
    Then I should get 200
    And  the response should be true