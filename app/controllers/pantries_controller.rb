class PantriesController < ApplicationController
  before_action :set_pantry, only: [:show, :edit, :update, :destroy]

  def index
    @pantries = Pantry.all
  end

  def show
  end

  def new
    @pantry = Pantry.new
  end

  def edit
  end

  def create
    @pantry = Pantry.new(pantry_params)

    if @pantry.save
      redirect_to ingredients_path, notice: 'Pantry was successfully created.'
    else
      render 'ingredients/index'
    end
  end

  def update
    if @pantry.update(pantry_params)
      redirect_to pantries_path, notice: 'Pantry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pantries/1
  def destroy
    @pantry.destroy
    redirect_to pantries_url, notice: 'Pantry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pantry
      @pantry = Pantry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pantry_params
      params.require(:pantry).permit(:ingredient_id, :user_id, :remark)
    end
end
