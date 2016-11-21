class PagesController < ApplicationController
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_admin_session_path, :alert => exception.message
  end

  before_action :set_user, only: [:checkedin]

  def search_users
    authorize! :pages, :search_users
    @users = User.search(params[:search]) unless params[:search].blank?
    respond_to do |format|
      format.html { render pages_search_users_path }
      format.json { render :json => @users, status: :ok }
    end
  end

  def home
    authorize! :pages, :home
  end

  def index
    authorize! :pages, :index
    @users = User.all
  end

  def checkedin
    authorize! :pages, :checkin

    if !(booking = @user.bookings.where("checkin = ?", Date.today).first).blank?
      booking.update({confirmed: true})
      send_email booking
    else
      @user.bookings.create({checkin: Date.today, confirmed: true})
      send_email booking
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def send_email booking
    if !booking.admin.blank? && booking.confirmed
      email = Mailer.new('tqrecautomatic@gmail.com', booking.admin.email, "Guest Arrived")
      email.send_email "#{booking.user.full_name} just checked in at the reception."
    end
  end
end
