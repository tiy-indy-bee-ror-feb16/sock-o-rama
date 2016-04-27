class OrderItemsController < ApplicationController
  before_action :get_order

  def create
    @order_item = @order.order_items.new(order_item_params)
    @order.user = current_user
    @order.save
    session[:order_id] = @order.id
  end

  def update
  end

  def destroy
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :sock_id)
  end

  def get_order
    @order = current_order
  end
end
