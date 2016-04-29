class SocksController < ApplicationController
  before_action :set_scope, only: [:index]

  def index
    @socks = Sock.all
    @colors = Sock.uniq.pluck(:color)
    @styles = Sock.uniq.pluck(:style)
  end

  def show
    @sock = Sock.find(params[:id])
    @order_item = current_order.order_items.new
    @sock_sizes = @sock.sock_sizes
  end

  private

  def set_scope
    if params[:filter]
      @scope = Sock.tagged_with(params[:color])
    else
      @scope = Sock
    end
    @scope
  end

end
