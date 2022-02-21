class Book < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_one_attached :image

  validates :title, :author, :image, presence: true
end
