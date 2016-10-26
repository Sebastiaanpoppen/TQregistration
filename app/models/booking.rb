class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  before_create :set_date

  validates :checkin, presence: true
  validate :already_exist?

  private

  def self.order_by_checkin type
    type.blank? ? order(checkin: :desc) : order(checkin: type)
  end

  def self.from_today
    where('checkin <= ?', Time.now)
  end

  def set_date
    self.checkin.to_date
  end

  def already_exist?
    if Booking.where("user_id = ? AND checkin = ?",user_id, checkin.to_date).first
      errors.add(:checkin, "Date Not Available")
      return false
    else
      return true
    end
  end
end
