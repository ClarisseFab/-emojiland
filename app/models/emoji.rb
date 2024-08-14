class Emoji < ApplicationRecord

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
