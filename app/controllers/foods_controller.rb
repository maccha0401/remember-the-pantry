class FoodsController < ApplicationController
  def index
    @foods = Food.all.includes(:food_category)
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def history
    return @foods = [] if cookies[:food_history].nil?
    history = cookies[:food_history].split(",").map(&:to_i)
    @foods = history.reverse.map do |id|
      Food.find(id)
    end
  end

  def delete_history
    cookies.delete(:food_history)
    @foods = []
    render 'history'
  end

  private
    def food_params
      params.require(:food).permit(:name)
    end
end
