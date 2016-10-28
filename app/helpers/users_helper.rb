module UsersHelper

  def user_email user
    !user.email.nil? ? user.email : "Unregistered"
  end

  def user_company user
    !user.company.nil? ? user.company : ""
  end

  def last_checkin user
    @booking = user.bookings.where('checkin <= ?', Date.today).first
    if @booking.blank?
      "never checked in yet"
    else
      @booking.checkin.to_date
    end
  end
end
