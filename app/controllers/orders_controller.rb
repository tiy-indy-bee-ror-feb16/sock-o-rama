class OrdersController < ApplicationController

  def show
    @user = current_or_guest_user
    @address = @user.addresses.first
  end
end
