class User < ApplicationRecord
  has_many :bookings
  before_create :set_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, if: :newsletter_checked?
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

  def newsletter_checked?
      if email.blank?
      errors.add(:newsletter, "Email must be filled in if you want to receive our newsletter")
      return false
    end
  end

end
