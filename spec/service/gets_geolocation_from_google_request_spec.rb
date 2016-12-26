require "rails_helper"

describe "user query is turned to geolocation" do
  it "has a valid city" do
    location = 'Denver'
    coords = GoogleService.convert_to_coords(location)

    expect(coords).to eq("39.7392358,-104.990251")
  end
end
