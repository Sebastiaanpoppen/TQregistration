require 'rails_helper'

describe "Viewing an individual user" do
  let(:user) { create :user }

  it "shows the user's details" do
    visit user_url(user)
    expect(page).to have_text(user.first_name)
    expect(page).to have_text(user.last_name)
  end
end
