class Emoji < ApplicationRecord
  belongs_to :user
  has_many :bookings
  
  has_one_attached :picture
  
  validates :price, numericality: { only_float: true }
  validates :price, :description, :name, :user, presence: true
end
