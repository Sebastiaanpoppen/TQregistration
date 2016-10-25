require 'rails_helper'

describe "Opening home page" do


it "open the search user function" do
  visit root_path

  click_link('existing_user')

  visit pages_search_users_path

  expect(page).to have_text("Search for existing user")
  end
end
