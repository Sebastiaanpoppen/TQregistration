class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  alias_method :current_user, :current_admin# Could be :current_member or :logged_in_user
  
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || admin_bookings_path(current_admin.id)
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin)
  end
end
