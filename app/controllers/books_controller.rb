class BooksController < ApplicationController
  
  before_action :require_login
  before_action :require_librarian, only: [:new, :create, :edit, :update]

  def index
    @user = nil
    @books = []
    if params.include? :user_id
      @user = User.find(params[:user_id])
      if @user != current_user
        redirect_to root_path
      end
      Book.all.each do |book|
        if book.present_user_id == @user.id
          @books << book
        end
      end
    else
      @books = Book.all
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :genre_id, :checked_out, :present_user_id)
  end

end
