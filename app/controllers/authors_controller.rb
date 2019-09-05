class AuthorsController < ApplicationController

  def new
  end

  def create
    author = Author.create(author_params)
    redirect_to author_path(author)
  end

  def show
    @author = Author.find(params[:id])
  end

  private

  def author_params
    params.require(:author).permit(:name, :deceased)
  end
end
