class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true



  def self.order_by value
    order(value)
  end
  def full_name
    "#{first_name} #{last_name}"
  end

end
