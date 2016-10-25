class UsersController < ApplicationController
before_action :set_user, only: [:index]

def index
  if @admin
    @users = User.all.order_by "first_name"
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
      format.xls #{ send_data @users.to_xls(col_sep: "\t") }
    end
  else
    redirect_to  new_admin_session_path
  end
end


def new
  @user = User.new
end

def show
  @user = User.find(params[:id])
end

def create
  @user = User.create( user_params )

  if @user.save
     redirect_to user_pages_checkedin_path(@user)
  else
     if @user.errors[:email].nil?
       render :new
     else
       @user = @user.errors[:email][0] #taking the existing user from the error
       redirect_to user_path(@user)
     end
  end
end


def update
end

def delete
end


private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :company, :email, :newsletter)
  end

private

def set_user
  !current_admin.nil? ? @admin = current_admin : @admin = false
end

end
