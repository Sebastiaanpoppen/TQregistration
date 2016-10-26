class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :admin

  validate :already_exist?

  private

  def already_exist?
    if Booking.where("user_id = ? AND checkin = ?",user_id, checkin).first
      errors.add(:checkin, "Date Not Available")
      return false
    else
      return true
    end
  end
end
