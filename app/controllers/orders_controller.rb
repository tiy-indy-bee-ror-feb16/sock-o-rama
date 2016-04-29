class OrdersController < ApplicationController

  def show
    @user = current_or_guest_user
    @address = @user.addresses.first
  end

  def mail_sending
    @order = Payola::Sale.find(params[:id])
    UserNotifierMailer.order_complete(@order)
  end
end
