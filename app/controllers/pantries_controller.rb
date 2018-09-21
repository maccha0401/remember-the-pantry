class PantriesController < ApplicationController
  before_action :set_pantry, only: [:show, :edit, :update, :destroy]

  # GET /pantries
  def index
    @pantries = Pantry.all
  end

  # GET /pantries/1
  def show
  end

  # GET /pantries/new
  def new
    @pantry = Pantry.new
  end

  # GET /pantries/1/edit
  def edit
  end

  # POST /pantries
  def create
    @pantry = Pantry.new(pantry_params)

    if @pantry.save
      redirect_to @pantry, notice: 'Pantry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pantries/1
  def update
    if @pantry.update(pantry_params)
      redirect_to @pantry, notice: 'Pantry was successfully updated.'
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
      params.require(:pantry).permit(:ingredient_id, :quantity, :user_id, :remark)
    end
end
