
class BookingsController < ApplicationController
  load_and_authorize_resource
  
  before_action :authenticate_admin!, only: [:index, :edit, :destroy, :update]
  before_action :set_admin, only: [:index, :edit, :destroy, :update]
  before_action :set_booking, only: [:update]
  skip_before_action :verify_authenticity_token, only: [:update]
  # before_action :set_company, only: [:create]

  def index
    if @admin
      @bookings = Booking.all.order_by_checkin(:desc).from_today
      respond_to do |format|
        format.html
        format.csv { send_data @bookings.to_csv }
        format.xls #{ send_data @bookings.to_xls(col_sep: "\t") }
      end
    else
      redirect_to  new_admin_session_path
    end
  end

  def create
    user_data = user_params
    @admin = Admin.find(params[:admin_id])
    if user = User.where('email = ?', user_data[:email]).first
      @booking = user.bookings.build(booking_params.merge!({admin_id: @admin.id}))
      save_booking @booking
    else
      user = User.create(user_data)
      if !user.id.blank?
        @booking = user.bookings.build(booking_params.merge!({admin_id: @admin.id}))
        save_booking  @booking
      else
        redirect_to admin_bookings_path
      end
    end
  end

  def update
    checked = params[:checked]
    if @booking.update({confirmed: checked})
      send_email
      respond_to do |format|
        format.html {redirect_to admin_bookings_path, notice: "Booking for #{@booking.user.full_name} confirmed"}
        format.json  {render json: @booking, status: :ok, location: admin_bookings_path}
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_bookings_path, alert: 'An error occured during the confimation of your booking.' }
        format.json { redirect_to admin_bookings_path, status: :unprocesseble}
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to admin_bookings_path
  end

  private

  def save_booking booking
    if booking.save
      redirect_to admin_bookings_path(@admin.id), notice: "Visit correctly created"
    else
      redirect_to admin_bookings_path, alert: "Something whent wrog with the creation of the new visit"
    end
  end

  def booking_params
    params.require(:booking).permit(:checkin)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :company, :email)
  end

  def set_admin
    @admin = Admin.find(params[:admin_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def send_email
    if !@admin.email.blank? && @booking.confirmed
      email = Mailer.new('tqrecautomatic@gmail.com', @admin.email, "Guest Arrived")
      email.send_email "#{@booking.user.full_name} just checked in at the reception."
    end
  end
  # def set_company user
  #   params[:user].company.empty? ? params[:user].company = @admin.user.company : params[:user].company.capitalize
  # end
end
