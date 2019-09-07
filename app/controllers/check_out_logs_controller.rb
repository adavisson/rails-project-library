class CheckOutLogsController < ApplicationController

  before_action :require_standard_user

  def new
    @book = Book.find(params[:book_id])
    @user = current_user
    @check_out = CheckOutLog.new
  end

  def create
    book = Book.find(params[:check_out_log][:book_id])
    if book.checked_out
      flash[:notice] = "This book has already been checked out."
      render book_path(book)
    else
      check_out = CheckOutLog.create(check_out_log_params)
      book.checked_out = true
      book.present_user_id = params[:check_out_log][:user_id]
      book.save
      redirect_to user_path(current_user)
    end
  end

  private

  def check_out_log_params
    params.require(:check_out_log).permit(:book_id, :user_id, :comment, :check_out_date)
  end
end
