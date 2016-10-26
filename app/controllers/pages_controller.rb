class PagesController < ApplicationController

  def search_users
    @users = User.search(params[:search]) unless params[:search].blank?
    respond_to do |format|
      format.html { render pages_search_users_path }
      format.json { render :json => @users, status: :ok }
    end
  end

  def home
  end

  def index
    @users = User.all
  end

  def checkedin
    @user = User.find(params[:user_id])
    if @user.bookings.where("checkin = ?", Date.today).first
      #confirm the checking and
    else
      @user.bookings.create({checkin: Date.today})
      #and confirm it
    end
  end

end
