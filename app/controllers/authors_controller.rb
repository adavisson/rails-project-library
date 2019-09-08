class AuthorsController < ApplicationController

  before_action :require_login
  before_action :require_librarian, only: [:new, :create]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_path(author)
    else
      render :new
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  private

  def author_params
    params.require(:author).permit(:name, :deceased)
  end
end
