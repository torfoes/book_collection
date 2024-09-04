class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  # :author, :price, :published_date, presence: true
  # validates :price, numericality: true
end