class SearchController < ApplicationController

  def index
    if params[:query].blank?
      @socks = Sock.order(:created_at).page(params[:page])
    else
      @socks = Sock.search(params[:query]).order(:created_at).page(params[:page])
    end
  render 'socks/index'
  end
end
