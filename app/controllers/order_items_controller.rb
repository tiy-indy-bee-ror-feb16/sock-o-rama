class OrderItemsController < ApplicationController
  before_action :get_order

  def create
    @order_item = @order.order_items.new(order_item_params)
    @order_item.quantity = 1
    @order.user = current_user if current_user
    @order.save
    session[:order_id] = @order.id
    redirect_to :back
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order.order_items.find(params[:id]).destroy
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :sock_size_id)
  end

  def get_order
    @order = current_order
  end
end
