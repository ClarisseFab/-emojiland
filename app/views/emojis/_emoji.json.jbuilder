json.extract! emoji, :id, :name, :description, :price, :user_id, :created_at, :updated_at, :picture
json.url emoji_url(emoji, format: :json)
