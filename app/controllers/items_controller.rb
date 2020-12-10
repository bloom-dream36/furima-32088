class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    # 更新後の遷移先をredirectで設定
    if item.update(item_params)
      redirect_to item_path, method: :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :prefecture_id, :delivery_fee_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
