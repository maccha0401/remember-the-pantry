ActiveAdmin.register Recipe do
  permit_params :name, :category_id, :created_user_id
end
