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
    @recipe = current_user.recipes.new(recipe_params)
    ingredient = Ingredient.find_by(name: params[:recipe][:ingredient])
    @cooking_ingredient = @recipe.cooking_ingredients.new(ingredient_id: ingredient.id)


    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.' if @cooking_ingredient.save
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
      params.require(:recipe).permit(:name, cooking_ingredients_attributes: [:ingredient])
    end
end
