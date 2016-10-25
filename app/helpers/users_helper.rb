module UsersHelper

  def user_email user
    !user.email.nil? ? user.email : "Unregistered"
  end

  def user_company user
    !user.company.nil? ? user.company : ""
  end
end
