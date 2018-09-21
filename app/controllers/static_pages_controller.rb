class StaticPagesController < ApplicationController
  def home
    @my_pantries = current_user.my_pantries if logged_in?
  end
end
