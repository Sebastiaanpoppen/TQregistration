class AdminsController < Devise::RegistrationsController
  before_filter :authorize_admin, only: [:create, :destroy]
  skip_before_action :require_no_authentication, only: :new

  def create
    if Admin.create(admin_params)
      redirect_to "/admin", notice: "New admin succesfully created"
    else
      redirect_to "/admin" , alert: "There was an error creating the new admin"
    end
  end

  def sign_up(resource_name, resource)
    true
  end
  private

  # This should probably be abstracted to ApplicationController
  # as shown by diego.greyrobot
  def authorize_admin
    return unless !current_admin.super_admin?
    redirect_to admin_bookings_path, alert: 'Admins only!'
  end

  def admin_params
    params.require(:admin).permit(:email, :password)
  end

end
