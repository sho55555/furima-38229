class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  protect_from_forgery
  
  def index
    @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_price, :category_id, :prefecture_id, :sales_status_id, :scheduled_delivery_id, :shipping_fee_status_id, :image).merge(user_id: current_user.id)
  end

end
