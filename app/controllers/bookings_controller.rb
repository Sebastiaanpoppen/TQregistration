class BookingsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin
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
    if user = User.where('email = ?', user_data[:email]).first
      @booking = user.bookings.build(booking_params.merge!({admin_id: @admin.id}))
      save_booking  @booking
    else

      user = User.create(user_data)
      if user.save
        @booking = user.bookings.build(booking_params.merge!({admin_id: @admin.id}))
        save_booking @booking
      else
        redirect_to admin_users_path
      end
    end
  end

  private

  def save_booking booking
    if booking.save
      redirect_to admin_booking_path(@admin.id, booking.id), notice: "Visit correctly created"
    else
      redirect_to admin_users_path, alert: "Something whent wrog with the creation of the new visit"
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

  # def set_company user
  #   params[:user].company.empty? ? params[:user].company = @admin.user.company : params[:user].company.capitalize
  # end
end
