class PagesController < ApplicationController
  def home
  end

  def checkedin
    @user = User.find(params[:user_id])
  end

end
