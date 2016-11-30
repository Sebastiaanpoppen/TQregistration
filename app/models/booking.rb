class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  before_validation :set_date
  validate :already_exist?, on: [:create]
  validate :in_the_past?, on: [:create]
  validates :checkin, presence: true

  before_save :notify_via_email

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
    return if Booking.where("user_id = ? AND checkin = ?", user_id, checkin.to_date).count == 0
    errors.add(:checkin, "This guest is already registered for that date")
  end

  def in_the_past?
    return if checkin >= Date.today
    errors.add(:checkin, "Can't register guests in the past, sorry :)")
  end

  def notify_via_email
    return unless valid? && confirmed_changed? && confirmed?
    BookingMailer.guest_arrived(self).deliver_now
  end
end
