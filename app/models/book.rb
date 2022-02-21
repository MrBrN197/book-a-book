class Book < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :title, :author, :image, presence: true
end
