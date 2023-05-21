class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
end
