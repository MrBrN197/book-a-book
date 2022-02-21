class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :reservation_date, presence: true
  validates :city, presence: true, length: { maximum: 250 }
end
