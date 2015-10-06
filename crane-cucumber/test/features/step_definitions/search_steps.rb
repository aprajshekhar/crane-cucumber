search_client = CraneApiTests::SearchClient.new("#{BASE_URL}")

When(/^I search for (.+)$/) do |keyword|
  @response = search_client.search(keyword)
end

And(/^the response should have the searched term$/) do
json_data = ActiveSupport::JSON.decode(@response.body)
# if the search term is not found num_results will be 0
json_data['num_results'] > 0

end