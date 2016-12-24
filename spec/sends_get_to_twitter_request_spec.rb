require "rails_helper"

describe "user searches city", :type => :request do
  it "has a valid city" do
    search = "Denver"
    get "/tweets?query=#{search}"

    parsed_tweets = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(parsed_tweets.count).to eq(10)
  end
end
