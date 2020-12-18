class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :item_data, only: [:index, :create]
  before_action :order_user, only: [:index, :create]
 

  def index
    if @item.order != nil
      redirect_to root_path
    else
      @address_order = AddressOrder.new
    end
  end

  def create
    @address_order = AddressOrder.new(order_params)

    if @address_order.valid? 
      pay_item
      @address_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:address_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :tell).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def item_data
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: item_data[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
  end


  def order_user
    unless current_user != @item.user
      redirect_to root_path
    end
  end
end