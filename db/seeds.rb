# require 'faker'

# p "Destroying all categories... 💀"
# EmojiCategory.destroy_all
# Category.destroy_all

# p "Destroying users... 💀"
# User.destroy_all

# p "Destroying all emojis... 💀"
# Emoji.destroy_all
# # emojis déjà lié à user

# p "Creating a new user test... 🔄"

# usertest = User.create!(
#   email: "test@test.com",
#   password: "123456",
#   last_name: "Toto",
#   first_name: "Tata"
# )

p "Creating category... 🔄"
# categories = ["panda", "licorn", "hedgehog", "sloth"]
categories = ["🦔", "🦥", "🐼", "🦄"]

categories.each { |c| Category.create(name: c) }

# p "Creating 10 new emojis... 🔄"

# 10.times do
#   emoji = Emoji.new(
#     name: Faker::JapaneseMedia::OnePiece.character,
#     description: Faker::Lorem.paragraph,
#     price: Faker::Commerce.price,
#     user: usertest
#   )

#   file = URI.open(Faker::LoremFlickr.image)
#   emoji.categories << Category.all.sample
#   emoji.picture.attach(io: file, filename: "nes.png", content_type: "image/png")
#   emoji.save!
# end


# # p "Creating bookings... 🔄"
# # # categories = ["panda", "licorn", "hedgehog", "sloth"]
# # bookings = ["🐼", "🦄", "🦔", "🦥"]

# # bookings.each { |c| Category.create(name: c) }


p "Finished! 👏"
