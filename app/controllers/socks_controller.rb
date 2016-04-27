class SocksController < ApplicationController

  def index
    @socks = Sock.all
  end

end
