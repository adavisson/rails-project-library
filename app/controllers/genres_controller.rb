class GenresController < ApplicationController

  def new
  end

  def create
    genre = Genre.create(genre_params)
    redirect_to genre_path(genre)
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private

  def author_params
    params.require(:genre).permit(:name)
  end

end