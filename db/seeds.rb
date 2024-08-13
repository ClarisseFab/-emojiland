require 'faker'

p "Destroying users... 💀"
User.destroy_all

p "Destroying all emojis... 💀"
Emoji.destroy_all

p "Creating a new user test... 🔄"

usertest = User.create!(
  email: "test@test.com",
  password: "123456",
  last_name: "Toto",
  first_name: "Tata"
)

p "Creating 10 new emojis... 🔄"

10.times do
  emoji = Emoji.new(
    name: Faker::JapaneseMedia::OnePiece.character,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    user: usertest
  )

  file = URI.open(Faker::LoremFlickr.image)
  emoji.picture.attach(io: file, filename: "nes.png", content_type: "image/png")
  emoji.save!
end

# test à enlever
Emoji.create!(
  name: Faker::JapaneseMedia::OnePiece.character,
  description: Faker::Lorem.paragraph,
  price: Faker::Commerce.price,
  user: usertest
)

p "Finished! 👏"
