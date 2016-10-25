class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :admin

  validate :is_available?

  private

  def is_available?
    if Booking.where("user_id = ? AND checkin = ?",user_id, checkin) != []
      errors.add(:checkin, "Date Not Available")
      return false
    else
      return true
    end
  end
end
