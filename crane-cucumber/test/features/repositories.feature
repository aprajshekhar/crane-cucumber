Feature: Tests the repositories functionality
  Scenario: Test the repositories endpoint
    Given Crane CI is up
    When I retrieve list of repositories
    Then I should get 403

    Scenario: Test the images endpoint
      Given Crane CI is up
      When I retrieve image list for repository having redhat/rhel7.0 repository id
      Then I should get 200
      And the retrieved image ids should match

    Scenario: Test the tags endpoint
      Given Crane CI is up
      When I retrieve tags list for repository having redhat/rhel7.0 repository id
      Then I should get 200
      And the retrieved tags should match

    Scenario: Test the tag endpoint
      Given Crane CI is up
      When I retrieve tag 0-23 for repository having redhat/rhel7.0 repository id
      Then I should get 200
      And the retrieved id for the tag should match

