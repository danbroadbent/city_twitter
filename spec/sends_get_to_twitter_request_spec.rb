require "rails_helper"

describe "user searches city", :type => :request do
  it "has a valid city" do
    faraday get request

    expect(response.status).to eq(200)
  end
end
