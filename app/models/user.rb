class User < ApplicationRecord

  def self.order_by value
    order(value)
  end
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
