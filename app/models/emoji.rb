class Emoji < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :picture
end
