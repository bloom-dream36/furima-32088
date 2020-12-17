class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :item_user, only: [:update, :edit, :destroy]
  before_action :sold_out, only: [:edit, :destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path, method: :show
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
       redirect_to root_path
    else
      render :show
    end
  end
  private

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :prefecture_id, :delivery_fee_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_user
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def sold_out
    if @item.order != nil
      redirect_to root_path
    end
  end
end
