class UsersController < ApplicationController

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    unless user.id = current_user.id
      redirect_to books_path
    else
      @user = User.find(params[:id])
      @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
