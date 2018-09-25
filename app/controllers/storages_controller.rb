class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def create
    @storage = Storage.new(storage_params)

    if @storage.save
      food_history = []
      food_history = cookies[:food_history].split(",") if cookies[:food_history]
      food_history.delete_at(0) if food_history.length >= 10
      food_history << @storage.food_id
      cookies[:food_history] = food_history.join(",")
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

  def destroy_all
    storages = current_user.my_pantry
    Storage.delete(storages)
    redirect_to root_url, notice: "全ての食材をパントリーから削除しました"
  end

  private
    def set_storage
      @storage = Storage.find(params[:id])
    end

    def storage_params
      params.require(:storage).permit(:food_id, :user_id, :remark)
    end
end
