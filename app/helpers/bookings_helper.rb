module BookingsHelper

  def past? checkin
    checkin.to_date < Date.today ? "label-danger" : "label-success"
  end
end
