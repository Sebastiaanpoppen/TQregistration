require 'rails_helper'

feature 'Create new User', js: true do
  scenario 'Create a new user' do
    # Point your browser towards the todo path
    visit root_path
    # Clicks Link it's my first time
    click_link("It's my first time")
    # Enters newuser page
    expect(page).to have_text("Oh wait..")
    # Fill in user details
    fill_in('First Name', :with => 'Peter')
    fill_in('Last Name', :with => 'Pancake')
    fill_in('Company', :with => 'Peter Pancakes')
    # confirm user details and click button
    click_button("Create")
    # Enters welcome page
    expect(page).to have_text("Welcome")
  end
end
