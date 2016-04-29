class OrdersController < ApplicationController

  def show
    @user = current_or_guest_user
    @address = @user.addresses.first
  end

  def mail_sending
    @sale = Payola::Sale.find(params[:id])
    UserNotifierMailer.order_complete(@sale)
    session[:order_id] = nil
    flash[:success] = "Order complete. Email on the way!"
    redirect_to :root
  end
end
