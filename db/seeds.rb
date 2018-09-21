# Users
User.create!(name: "John Doe",
            email: "johndoe@example.com",
            password: "nicesense",
            password_confirmation: "nicesense")

User.create!(name: "hoge fuga",
            email: "hogefuga@example.com",
            password: "foobar",
            password_confirmation: "foobar")

# Foods
foods = %w[鶏肉 玉ねぎ 卵 豚肉 キャベツ 牛肉 じゃがいも 人参]

foods.each do |food|
  Food.create!(name: food)
end
