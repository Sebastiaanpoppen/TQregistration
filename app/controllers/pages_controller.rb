class PagesController < ApplicationController

  def search_users
    @users = User.search(params[:search]) unless params[:search].blank?
  end

  def home
  end
end
