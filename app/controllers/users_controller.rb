class UsersController < ApplicationController
before_action :set_admin, only: [:index]

def index
  if @admin
    @users = User.all.order_by "first_name"
    @booking = Booking.new
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
      format.xls #{ send_data @users.to_xls(col_sep: "\t") }
    end
  else
    redirect_to new_admin_session_path
  end
end


def new
  @user = User.new
end

def show
  @user = User.find(params[:id])
end

def create
  @user = User.create(user_params)
  if !@user.id.blank?
    booking = @user.bookings.build({checkin: Date.today})
    save_booking booking
  else
    if @user.errors[:email].blank?
      render :new
    else
      @user = @user.errors[:email][0] #taking the existing user from the error
      if @user.bookings.where("checkin = ?", Date.today)
        redirect_to user_pages_checkedin_path(@user)
      else
        booking = @user.bookings.build({checkin: Date.today})
        save_booking booking
      end
    end
  end
end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :company, :email, :newsletter)
  end

private

def save_booking booking
  if booking.save
    redirect_to user_pages_checkedin_path(booking.user)
  else
    render :new
  end
end

def set_admin
  !current_admin.nil? ? @admin = current_admin : @admin = false
end

end
