class OrderItemsController < ApplicationController
  before_action :get_order
  before_action :check_for_existing_item, only: [:create]
  require 'securerandom'

  def create
    @order_item = @order.order_items.new(order_item_params)
    @order_item.quantity = 1
    @order.user = current_or_guest_user
    @order.permalink ||= SecureRandom.hex(5).to_s
    @order.name ||= "order-#{SecureRandom.hex(5)}"
    @order.save!
    session[:order_id] = @order.id
    session[:permalink] = @order.permalink
    redirect_to cart_path
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    @order.save!
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

  def check_for_existing_item
    existing_item = current_order.order_items.where("sock_size_id = ?", params[:order_item][:sock_size_id])
    if existing_item[0]
      existing_item[0].quantity += 1
      existing_item[0].save
      redirect_to cart_path
    end
  end
end
