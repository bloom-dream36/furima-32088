class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new  authenticate_user!
  end

  def create
    @item = Item.new(item_params)
    
   if @item.save
      redirect_to root_path
   else
      render :new
   end
  end

   private 
   
  def item_params
   params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :prefecture_id, :delivery_fee_id, :delivery_day_id, :price).merge(user_id: current_user.id )
  end
end