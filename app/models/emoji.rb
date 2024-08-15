class Emoji < ApplicationRecord
#  has_many :users, through: :emoji_bookings, source: :user

  has_many :emoji_categories
  has_many :categories, through: :emoji_categories, source: :category



  acts_as_taggable_on :tags
  # acts_as_taggable_on :skills, :interests
  #You can also configure multiple tag types per model


  belongs_to :user
  has_many :bookings, dependent: :destroy


  has_one_attached :picture

  validates :price, numericality: { only_float: true }
  validates :price, :description, :name, :user, presence: true

  before_destroy :purge_picture

  def purge_picture
    picture.purge
  end
end
