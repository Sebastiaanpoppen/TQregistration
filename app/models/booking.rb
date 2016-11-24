class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  before_create :set_date
  validate :already_exist?, on: [:create]
  validate :in_the_past?, on: [:create]
  validates :checkin, presence: true

  after_save :notify_via_email

  private

  def self.order_by_checkin type
    type.blank? ? order(checkin: :desc) : order(checkin: type)
  end

  def self.from_today
    where('checkin <= ?', Date.today)
  end

  def set_date
    self.checkin = checkin.to_date
  end

  def already_exist?
    if Booking.where("user_id = ? AND checkin = ?",user_id, checkin.to_date).first
      errors.add(:checkin, "Date Not Available")
      return false
    else
      return true
    end
  end

  def in_the_past?
    if checkin < Date.today
      errors.add(:checkin, "Invalid dates")
      return false
    end
  end

  def notify_via_email
    return unless confirmed_changed? && confirmed?
    BookingMailer.guest_arrived(self).deliver_now
  end
end
