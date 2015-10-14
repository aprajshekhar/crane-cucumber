repository_client = CraneApiTests::RepositoryClient.new("#{BASE_URL}")

When(/^I retrieve list of repositories$/) do
  @response = repository_client.get_repositories
end

And(/^the retrieved image ids should match$/) do
  match(@repo_id, 'images')
end

When(/^I retrieve image list for repository having (.+) repository id$/) do |repo_id|
  @response = repository_client.get_images(repo_id)
  @repo_id = repo_id
end

When(/^I retrieve tags list for repository having (.+) repository id$/) do |repo_id|
  @response = repository_client.get_tags(repo_id)
  @repo_id = repo_id
end

def match(repo_id, component)
  retrieved_data = ActiveSupport::JSON.decode(@response.body)
  match_with_data = $cache.cache.fetch(repo_id)
  match_with_data[component] == retrieved_data
end

And(/^the retrieved tags should match$/) do
  match(@repo_id, 'tags')
end

When(/^I retrieve tag (.+) for repository having (.+) repository id$/) do |tag, repo_id|
  @response = repository_client.get_tag(repo_id, tag)
  @repo_id = repo_id
  @tag = tag
end

And(/^the retrieved id for the tag should match$/) do

end

def match_image_id(repo_id, tag)
  retrieved_data = ActiveSupport::JSON.decode(@response.body)
  match_with_data = $cache.cache.fetch(repo_id)
  match_with_data[component][tag] == retrieved_data
end