class AdminsController < Devise::RegistrationsController
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_bookings_path, :alert => exception.message
  end

  before_filter :authorize_admin, only: [:create, :destroy, :manage_admins, :toggle]
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


  def update
    @admin = Admin.find(params[:id])
    @admin.update_attributes(admin_params)
    respond_to do |format|
    format.html { redirect_to admin_superadmin_path(@admin) }
    format.js
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
    params.require(:admin).permit(:email, :password, :active, :full_access)
  end

end
