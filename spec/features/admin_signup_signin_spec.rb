require 'rails_helper'

describe "Admin signup and signin" do

let(:admin) { create :admin }

it "open the it's my first time function" do
  visit root_path
  #add link to Admin login through TQ logo when ready
  visit admin_session_path
  expect(page).to have_text("Forgot Password")
  fill_in('Email', :with => admin.email)
  fill_in('Password', :with => admin.password)
  click_button "Log In"
  expect(page).to have_text("Signed in successfully")
  end
end
