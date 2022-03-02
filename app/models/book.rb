class Book < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :title, :author, :price, :description, :rating, :genre, :image, presence: true
  validates :title, uniqueness: { scope: :author, message: 'Title and Author already exists' }
end
