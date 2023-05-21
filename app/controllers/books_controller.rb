class BooksController < ApplicationController
  def new
    @book =Book.new
  end

  def create
    @book = Book.new(book_params)
    @book_image.user_id = current_user.id

    if @book.save
      redirect_to book_path
    else
      @books =Book.all
      @user = current_user
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
