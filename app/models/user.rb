class User < ApplicationRecord
  has_many :bookings
  before_create :set_email

  validates :first_name, presence: { message: "Please fill in your first name" }
  validates :last_name, presence: { message: "Please fill in your last name" }
  validate :existing?

  def self.order_by value
    order(value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search(search)
    where('first_name ILIKE :search OR last_name ILIKE :search OR email ILIKE :search', search: "%#{search}%")
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
  private

  def existing?
    @user = User.where('email = ?', email).first
    if @user && !@user.email.empty?
      errors.add(:email, @user)
      return false
    else
      return true
    end
  end

  def set_email
    if email.empty? || email.blank?
      self.email = nil
    end
  end
end
