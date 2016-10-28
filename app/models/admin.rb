class Admin < ApplicationRecord
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 private
 def existing?
   @admin = Admin.where('email = ?', email).first
   if @admin && !@admin.email.empty?
     errors.add(:email, @admin)
     return false
   else
     return true
   end
 end

end
