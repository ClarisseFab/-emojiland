class Emoji < ApplicationRecord
  belongs_to :user
  has_many :bookings

  
  validates :price, numericality: { only_float: true }
  validates :price, :description, :name, :user, presence: true
end
