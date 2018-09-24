class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]

  def index
    @storages = Storage.all
  end

  def show
  end

  def new
    @storage = Storage.new
  end

  def edit
  end

  def create
    @storage = Storage.new(storage_params)

    if @storage.save
      redirect_to foods_path, notice: "#{@storage.food.name}をパントリーに追加しました"
    else
      render 'foods/index'
    end
  end

  def update
    if @storage.update(storage_params)
      redirect_to root_path, notice: 'メモを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @storage.destroy
    redirect_to root_url, notice: "#{@storage.food.name}をパントリーから削除しました"
  end

  private
    def set_storage
      @storage = Storage.find(params[:id])
    end

    def storage_params
      params.require(:storage).permit(:food_id, :user_id, :remark)
    end
end
