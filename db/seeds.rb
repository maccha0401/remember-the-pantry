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

# Recipes
user = User.first
recipes = %w[親子丼 ホイコーロー ビーフカレー]

recipes.each do |recipe|
  user.recipes.create!(name: recipe)
end

recipe = user.recipes.find_by(name: "親子丼")
recipe.ingredients.create!(food_id: 1)
recipe.ingredients.create!(food_id: 2)
recipe.ingredients.create!(food_id: 3)

recipe = user.recipes.find_by(name: "ホイコーロー")
recipe.ingredients.create!(food_id: 4)
recipe.ingredients.create!(food_id: 5)

recipe = user.recipes.find_by(name: "ビーフカレー")
recipe.ingredients.create!(food_id: 6)
recipe.ingredients.create!(food_id: 7)
recipe.ingredients.create!(food_id: 8)
