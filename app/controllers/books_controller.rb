class BooksController < ApplicationController

  def new
  end

  def create
    book = Book.create(book_params)
    redirect_to book_path(book)
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def
    params.require(:book).permit(:title, :author_id, :genre_id, :checked_out, :present_user_id)
  end

end
