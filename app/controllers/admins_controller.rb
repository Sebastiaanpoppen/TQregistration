class AdminsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(admin_params)
      if @admin.save
          redirect_to admin_bookings_path
      else
        render :new
    end
  end

end

private
  def admin_params
    params.require(:admin).permit(:email, :password)
  end
