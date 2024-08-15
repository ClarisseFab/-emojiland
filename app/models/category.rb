class Category < ApplicationRecord
  has_many :emoji_categories
  has_many :emojis, through: :emoji_categories, source: :emoji
end
