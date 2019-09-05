class BooksController < ApplicationController
  
  before_action :require_login
  before_action :require_librarian, only: [:new, :create]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.create(book_params)
    redirect_to book_path(book)
  end

  def show
    @book = Book.find(params[:id])
  end

  def check_out_page
    @book = Book.find(params[:id])
    @user = current_user
  end

  def check_out
    book = Book.find(params[:id])
    user = current_user
    book.check_out(user, params[:comment])
    redirect_to user_page(user)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :genre_id, :checked_out, :present_user_id)
  end

end
