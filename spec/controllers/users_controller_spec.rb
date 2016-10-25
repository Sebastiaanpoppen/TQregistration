require 'rails_helper'

# Checks if user can register
RSpec.describe UsersController, type: :controller do
  it "should get new" do
      get :new
      expect(response).to be_success
      expect(assigns(:users)).to eq(nil)
    end
end
