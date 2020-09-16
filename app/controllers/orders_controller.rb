class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def create
      @item = Item.find(params[:item_id])
      @order = Order.new(order_params)
      if @order.valid?
        pay_item
        @order.save
        return redirect_to root_path
      else
        # render :index
      end
  end

  private
  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    @item = Item.find(params[:item_id]) 
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    # カードトークン
      currency:'jpy'
    )
  end
end
