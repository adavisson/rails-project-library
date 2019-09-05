class User < ApplicationRecord
  has_secure_password
  
  has_many :check_out_logs
  has_many :books, through: :check_out_logs
end
