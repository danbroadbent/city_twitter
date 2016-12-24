require "rails_helper"

describe "logged in user visits following feed", :type => :feature do
  it "has required elements" do
    visit '/'
    expect(page).to have_content("Search")
    expect(page).to have_content("Submit")
    expect(page).to have_content("Tweets about")
  end
end
