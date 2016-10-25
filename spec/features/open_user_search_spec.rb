require 'rails_helper'

describe "Opening home page" do


it "open the search user function" do
  visit root_path

  click_link("I have been here before")

  visit pages_search_users_path

  expect(page).to have_text("Oops, it's my first time")
  end
end
