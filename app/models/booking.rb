class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :admin

  validate :already_exist?
  before_create :set_date

  private

  def self.order_by_checkin type
    type.blank? ? order(checkin: :desc) : order(checkin: type)
  end

  def self.from_today
    where('checkin <= ?', Time.now)
  end
  def set_date
  end
  def already_exist?
    debugger
    if Booking.where("user_id = ? AND checkin.to_date = ?",user_id, checkin.to_date).first
      errors.add(:checkin, "Date Not Available")
      return false
    else
      return true
    end
  end
end
