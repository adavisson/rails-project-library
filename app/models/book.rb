class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :check_out_logs
  has_many :users, through: :check_out_logs

  def check_out(user, comment)
    CheckOutLog.create(book_id: self, user_id: user, comment: comment)
  end

end
