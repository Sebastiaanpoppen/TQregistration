class AdminsController < Devise::RegistrationsController
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_bookings_path, :alert => exception.message
  end

  before_filter :authorize_admin, only: [:create, :destroy, :manage_admins]
  skip_before_action :require_no_authentication, only: :new

  def manage_admins
    @admin = Admin.find(params[:id])
    @admins = Admin.all
  end


  def super_admin
    @admins = Admin.all
  end

  def create
    if Admin.create(admin_params)
      redirect_to "/admin", notice: "New admin succesfully created"
    else
      redirect_to "/admin" , alert: "There was an error creating the new admin"
    end
  end

  def destroy
    @admin = Admin.find(params[:admin_id])
    if !@admin.nil? && @admin.destroy
      redirect_to "/admin", notice: "admin succesfully deleted"
    else
      redirect_to "/admin" , alert: "There was an error deleting the admin"
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
