search_client = CraneApiTests::SearchClient.new("#{BASE_URL}")

When(/^I search for (.+)$/) do |keyword|
  @keyword = keyword
  @response = search_client.search(keyword)
end

And(/^the response should have the searched term$/) do
json_data = ActiveSupport::JSON.decode(@response.body)
p json_data
end