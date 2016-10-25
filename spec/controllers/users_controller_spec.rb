require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it "should get new" do
      get :new
      expect(response).to be_success
      expect(assigns(:users)).to eq(nil)
    end

end
