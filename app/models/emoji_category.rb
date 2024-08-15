class EmojiCategory < ApplicationRecord
  belongs_to :category
  belongs_to :emoji
end
