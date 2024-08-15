class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :emojis, through: :emoji_bookings, source: :emojis
  # ça fait peter my_emoji si en dessous de has-many

  has_many :emojis, dependent: :destroy
  has_many :bookings, dependent: :destroy




  validates :first_name, :last_name, :email, :password, presence: true
end
