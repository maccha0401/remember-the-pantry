ActiveAdmin.register Recipe do
  permit_params :name, :category, :created_user_id
end
