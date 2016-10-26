class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :admin

  validate :already_exist?

  private

  def self.order_by_checkin type
    type.blank? ? order(checkin: :desc) : order(checkin: type)
  end

  def self.from_today
    where('checkin <= ?', Time.now)
  end

  def already_exist?
    if Booking.where("user_id = ? AND checkin = ?",user_id, checkin).first
      errors.add(:checkin, "Date Not Available")
      return false
    else
      return true
    end
  end
end
