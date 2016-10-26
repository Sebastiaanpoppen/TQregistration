module BookingsHelper

  def past? checkin
    checkin.day < Time.now.day ? "label-danger" : "label-success"
  end
end
