
class BookingsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_admin!, only: [:index, :edit, :destroy, :update]
  before_action :set_admin, only: [:index, :edit, :destroy, :update]
  before_action :set_booking, only: [:update]
  skip_before_action :verify_authenticity_token, only: [:update]
  # before_action :set_company, only: [:create]

  def index
    if @admin
      set_bookings

      @booking = Booking.new

      respond_to do |format|
        format.html
        format.csv
        format.xls
      end
    else
      redirect_to  new_admin_session_path
    end
  end

  def create
    user_data = user_params
    booking_data = booking_params
    booking_data[:checkin] = booking_data[:checkin].to_date
    @admin = Admin.find(params[:admin_id])
    user = User.where('email = ?', user_data[:email]).first || User.create(user_data)
    @booking = Booking.new(booking_data)
    @booking.admin = @admin
    @booking.user = user
    save_booking!
  end

  def update
    checked = params[:checked]
    if @booking.update({confirmed: checked})
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

  def destroy_365days
    @bookings = Booking.where("checkin < ?", -365.days.from_now.to_date)
    @bookings.each do |booking|
      booking.destroy
    end
    redirect_to admin_bookings_path, notice: "Booking correcly deleted"
  end

  private

  def save_booking!
    if @booking.save
      redirect_to admin_bookings_path(@admin.id), notice: "Booking correctly registered"
    else
      redirect_to admin_bookings_path(@admin.id),
        alert: (@booking.errors[:checkin] && @booking.errors[:checkin].first) ||
          "There was a problem creating this booking"
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

  def set_bookings
    @admin.full_access || @admin.super_admin ?
      @bookings = Booking.includes(:user, :admin).order_by_checkin(:desc) :
      @bookings = @admin.bookings.includes(:user, :admin).order_by_checkin(:desc)
  end
end
