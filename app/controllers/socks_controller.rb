class SocksController < ApplicationController

  def index
    @socks = Sock.all
  end

  def show
    @sock = Sock.find(params[:id])
    @order_item = current_order.order_items.new
    @sock_sizes = @sock.sock_sizes
  end

end
