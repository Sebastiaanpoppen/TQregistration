class AdminsController < Devise::RegistrationsController
  load_and_authorize_resource
  protect_from_forgery with: :null_session, only: [:toggle_active, :toggle_full_access]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_bookings_path, :alert => exception.message
  end

  before_action :authorize_admin, only: [:create, :destroy, :manage_admins]
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

  def toggle_active
    @admin = Admin.find(params[:id])
    @admin.update_attributes(admin_params)

    respond_to do |format|
      format.json  { render json: @admin, status: :ok }
    end
  end

  def toggle_full_access
    @admin = Admin.find(params[:id])
    @admin.update_attributes(admin_params)

    respond_to do |format|
      format.json  { render json: @admin, status: :ok }
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
