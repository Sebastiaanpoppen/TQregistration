class PagesController < ApplicationController
  before_action :set_user, only: [:checkedin]

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
    if !(booking = @user.bookings.where("checkin = ?", Date.today).first).blank?
      booking.update({confirmed: true})
    else
      @user.bookings.create({checkin: Date.today, confirmed: true})
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
