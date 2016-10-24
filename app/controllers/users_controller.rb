class UsersController < ApplicationController
before_action :set_user, only: [:index]

def index
  if @user
    $users = User.all
  else
    redirect_to  new_admin_session_path
  end
end

def new
    @user = User.new
end

def create
end

def update
end

def delete
end

private

def set_user
  !current_admin.nil? ? @user = current_admin : @user = false
end

end
