class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    # TODO: レシピ作成未完成
    @recipe = current_user.recipes.build(recipe_params)
    food = Food.find_by(name: params[:recipe][:food])
    @ingredient = @recipe.ingredients.new(food_id: food.id)


    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.' if @ingredient.save
    else
      render :new
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, ingredients_attributes: [:food])
    end
end
