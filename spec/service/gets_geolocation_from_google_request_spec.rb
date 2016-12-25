require "rails_helper"

describe "user query is turned to geolocation" do
  it "has a valid city" do
    location = 'Denver'
    GoogleService.convert_to_coords(location)

    expect(search['total']).to eq(17)
    expect(search['stores'].count).to eq(15)
    expect(search.class).to eq(Hash)
  end
end
