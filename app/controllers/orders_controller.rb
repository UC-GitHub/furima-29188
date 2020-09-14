class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  private
  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: parrams[:item_id])
  end
end
