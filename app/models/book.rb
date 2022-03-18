class Book < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :title, :author, :genre, presence: true, length: { maximum: 100 }
  validates :price, :rating, presence: true, numericality: { greater_than: 0 }
  validates :description, :image, presence: true
  validates :title, uniqueness: { scope: :author, message: 'Title and Author already exists' }
end
