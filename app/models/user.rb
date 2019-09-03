class User < ApplicationRecord
  has_many :check_out_logs
  has_many :books, through: :check_out_logs
end
