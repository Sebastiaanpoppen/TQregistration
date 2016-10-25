class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validate :existing?


  def self.order_by value
    order(value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search(search)
    where('first_name ILIKE :search OR last_name ILIKE :search', search: "%#{search}%")
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
    if @user = User.where('email = ?', email).first
      errors.add(:email, @user)
      return false
    else
      return true
    end
  end
end
