status_client = CraneApiTests::StatusClient.new("#{BASE_URL}")

When(/^I check the status of v1 endpoint$/) do
  @response = status_client.get_status
end

Given(/^Crane CI is up$/) do
  true == status_client.is_up?
end

Then(/^I should get (\d+)$/) do |arg|
  arg.to_s == @response.code
end

And(/^the response should be true$/) do
  'true'==@response.body
end