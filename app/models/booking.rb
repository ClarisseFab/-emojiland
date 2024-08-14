class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :emoji
  validates :date_start_on, presence: true
  validates :date_end_on, presence: true
end
