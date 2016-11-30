module BookingsHelper

  def past? checkin
    checkin < Date.today ? "label-danger" : "label-success"
  end

  def future? checkin
    checkin > Date.today ? "label-future" : "label-success"
  end

  def admin booking
    booking.admin.blank? ? nil : booking.admin.id
  end

  def chart_data admin, type
    case type
    when 'day'
      (!admin.full_access.blank? && admin.full_access) || admin.super_admin ?
        Booking.group_by_day(:checkin, format: "%b %d, %Y", library: {yAxis: {allowDecimals: false}}).count : @admin.bookings.group_by_day(:checkin, format: "%b %d, %Y", library: {yAxis: {allowDecimals: false}}).count
    when 'month'
      (!admin.full_access.blank? && admin.full_access) || admin.super_admin ?
      Booking.group_by_month(:checkin, format: "%b", library: {yAxis: {allowDecimals: false}}).count : @admin.bookings.group_by_month(:checkin, format: "%b", library: {yAxis: {allowDecimals: false}}).count
    when 'year'
      (!admin.full_access.blank? && admin.full_access) || admin.super_admin ?
        Booking.group_by_year(:checkin, format: "%Y", library: {yAxis: {allowDecimals: false}}).count : @admin.bookings.group_by_year(:checkin, format: "%Y", library: {yAxis: {allowDecimals: false}}).count
    end


  end
end
