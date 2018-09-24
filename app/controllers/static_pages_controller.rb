class StaticPagesController < ApplicationController
  def home
    @my_pantry = current_user.my_pantry.includes(:food, food: :food_category) if logged_in?
  end
end
