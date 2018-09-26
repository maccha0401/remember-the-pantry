ActiveAdmin.register Ingredient do
  permit_params :recipe_id, :food_id
end
