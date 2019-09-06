class CheckOutLogsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @user = current_user
    @check_out = CheckOutLog.new
  end

  def create
    CheckOutLog.create(check_out_log_params)
    book = Book.find(params[:check_out_log][:book_id])
    book.checked_out = true
    book.save
    redirect_to user_path(current_user)
  end

  private

  def check_out_log_params
    params.require(:check_out_log).permit(:book_id, :user_id, :comment)
  end
end
