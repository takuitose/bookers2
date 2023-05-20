class UsersController < ApplicationController

  def show
    @user = user
  end

  def index
    @users = User.all
  end

  def edit
  end
end
