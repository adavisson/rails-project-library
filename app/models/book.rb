class Book < ApplicationRecord
  validates :title, presence: true
  validates :author_id, presence: true
  validates :genre_id, presence: true

  belongs_to :author
  belongs_to :genre
  has_many :check_out_logs
  has_many :users, through: :check_out_logs

end
