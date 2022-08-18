class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index, :create]

  def index
    @order_shipping = OrderShipping.new
    redirect_to root_path if user_signed_in? && current_user.id == @item.user.id
    if @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
