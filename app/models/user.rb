class User < ApplicationRecord

  def self.search(search)
    where('first_name ILIKE :search OR last_name ILIKE :search', search: "%#{search}%")
  end

end
