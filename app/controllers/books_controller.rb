class BooksController < ApplicationController

  before_action :require_librarian
  skip_before_action :require_librarian, only: [:index, :show]

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

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :genre_id, :checked_out, :present_user_id)
  end

end
