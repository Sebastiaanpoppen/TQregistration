module UsersHelper

  def user_email user
    !user.email.nil? ? user.email : "Unregistered"
  end
end
