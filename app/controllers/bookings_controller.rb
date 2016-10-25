class BookingsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @booking = current_admin.bookings.create(booking_params)
    redirect_to @booking.room, notice: "New visit correctly created"
  end

  private

  def booking_params
    params.require(:booking).permit(:checkin, :admin_id)
  end
end
