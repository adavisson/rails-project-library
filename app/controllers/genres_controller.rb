class GenresController < ApplicationController

  before_action :require_login
  before_action :require_librarian, only: [:new, :create]

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genre_path(genre)
    else
      render :new
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end