module BookingsHelper

  def past? checkin
    checkin.to_date < Date.today ? "label-danger" : "label-success"
  end

  def next_page page
    if page.nil?
      0
    else
      page + 1
    end
  end

  def slice_bookings
    @page_bookings = @bookings
    @bookings = @page_bookings.to_a.slice(0, 6)
  end

  def get_total_pages bookings
    @total_pages = (bookings.count.to_f/6).ceil
    @page = 0
  end
end
