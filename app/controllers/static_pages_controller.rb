class StaticPagesController < ApplicationController
  def home
    @my_pantry = current_user.my_pantry.includes(:food) if logged_in?
  end
end
