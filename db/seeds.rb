# Adminuser
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Users
User.create!(name: "hoge fuga",
            email: "hogefuga@example.com",
            password: "foobar",
            password_confirmation: "foobar") if Rails.env.development?

# Food_categories
require 'csv'
csv = CSV.read('db/seeds/food_categories.csv', headers: true)
csv.each do |data|
  FoodCategory.create!(data.to_hash)
end

# Foods
csv = CSV.read('db/seeds/foods.csv', headers: true)
csv.each do |data|
  Food.create!(data.to_hash)
end

# Recipes
user = User.first
csv = CSV.read('db/seeds/recipes.csv', headers: true)
csv.each do |data|
  user.recipes.create!(data.to_hash)
end

# Ingredients
csv = CSV.read('db/seeds/ingredients.csv', headers: true)
csv.each do |data|
  Ingredient.create!(data.to_hash)
end
