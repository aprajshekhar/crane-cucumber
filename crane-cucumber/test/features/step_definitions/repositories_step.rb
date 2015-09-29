repository_client = CraneApiTests::RepositoryClient.new("#{BASE_URL}")

When(/^I retrieve list of repositories$/) do
  @response = repository_client.get_repositories
end