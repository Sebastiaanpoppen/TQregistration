require 'rails_helper'

# Test works up until click_link from search bar. Should be fixed.

describe "search username" do

  let(:user) { create :user }

it "fill in name in the search user function" do
  visit pages_search_users_path
  expect(page).to have_text("Oops, it's my first time!")
  fill_in('search', :with => ':user.full_name')
  # click_button user.full_name
  # expect(page).to have_text("User information")

  end
end
