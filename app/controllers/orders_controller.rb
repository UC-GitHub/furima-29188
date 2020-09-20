class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create, :pay_item]
  
  def index
    @order = OrderShippingAddress.new
  end
  
  def create
      @order = OrderShippingAddress.new(order_params)
      # binding.pry
      if @order.valid?
        pay_item
        @order.save
        return redirect_to root_path
      else
        render :index
      end
  end

  private
  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :shipping_from_id, :city, :street_address, :building, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    # カードトークン
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
