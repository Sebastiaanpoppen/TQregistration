require 'rails_helper'

describe "Create User and checkin" do

it "open the it's my first time function" do
  visit root_path
  click_link("It's my first time")
  expect(page).to have_text("Oh wait..")
  fill_in('First Name', :with => 'Peter')
  fill_in('Last Name', :with => 'Pancake')
  fill_in('Company', :with => 'Peter Pancakes')
  click_button("Create")
  expect(page).to have_text("Welcome")
  end
end
