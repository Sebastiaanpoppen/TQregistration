
class BookingsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_admin!, only: [:index, :edit, :destroy, :update]
  before_action :set_admin, only: [:index, :edit, :destroy, :update]
  before_action :set_booking, only: [:update]
  skip_before_action :verify_authenticity_token, only: [:update]
  # before_action :set_company, only: [:create]

  def index
    if @admin
      (!@admin.full_access.blank? && @admin.full_access) || @admin.super_admin ?
        @bookings = Booking.all.order_by_checkin(:desc) : @bookings = @admin.bookings.order_by_checkin(:desc)

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
    booking_data = booking_params
    booking_data[:checkin] = booking_data[:checkin].to_date
    @admin = Admin.find(params[:admin_id])
    if user = User.where('email = ?', user_data[:email]).first
      @booking = user.bookings.build(booking_data.merge!({admin_id: @admin.id}))
      save_booking @booking
    else
      user = User.create(user_data)
      if !user.id.blank?
        @booking = user.bookings.build(booking_data.merge!({admin_id: @admin.id}))
        save_booking  @booking
      else
        redirect_to admin_bookings_path
      end
    end
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

  def save_booking booking
    if booking.save
      redirect_to admin_bookings_path(@admin.id), notice: "Visit correctly created"
    else
      redirect_to admin_bookings_path, alert: "Something went wrong with the creation of the new visit"
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
end
