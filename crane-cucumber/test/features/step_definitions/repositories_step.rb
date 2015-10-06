repository_client = CraneApiTests::RepositoryClient.new("#{BASE_URL}")

When(/^I retrieve list of repositories$/) do
  @response = repository_client.get_repositories
end

And(/^the retrieved image ids should match$/) do
  retrieved_data = ActiveSupport::JSON.decode(@response.body)
  match_with_data = $cache.cache.fetch(@repo_id)
  match_with_data['images'] == retrieved_data
end

When(/^I retrieve image list for repository having (.+) repository id$/) do |repo_id|
  @response = repository_client.get_images(repo_id)
  @repo_id = repo_id
end