class User < ApplicationRecord

  def self.order_by value
    order(value)
  end
end
