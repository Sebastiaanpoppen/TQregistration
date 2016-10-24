class UsersController < ApplicationController
before_action :set_user, only: [:index]

def index
  if @user

  else

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
  current_user.nil? ? @user = current_user : @user = false
end

end
