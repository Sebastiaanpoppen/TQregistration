module BookingsHelper

  def past? checkin
    checkin.to_date < Date.today ? "label-danger" : "label-success"
  end

  def admin booking
    booking.admin.blank? ? nil : booking.admin.id
  end
end
