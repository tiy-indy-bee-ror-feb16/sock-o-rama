class SearchController < ApplicationController

  def index
    @colors = Sock.uniq.pluck(:color)
    @styles = Sock.uniq.pluck(:style)
    if params[:query].blank?
      @socks = Sock.order(:created_at).page(params[:page])
    else
      @socks = Sock.search(params[:query]).order(:created_at).page(params[:page])
    end
    render 'socks/index'
  end
end
