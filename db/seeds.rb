require 'faker'

p "Desroying users ... 💀"
User.destroy_all

p "Desroying all emojis ... 💀"
Emoji.destroy_all

p "Creating a new user test ... 🔄"

usertest = User.create!(
  email: "test@test.com",
  password: "123456"
)

p "Creating 10 new emojis ... 🔄"

10.times do
  Emoji.create!(
    name: Faker::JapaneseMedia::OnePiece.character,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price,
    user: usertest
  )
end

p "Finished! 👏"
