class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :check_out_logs
  has_many :users, through: :check_out_logs
end
