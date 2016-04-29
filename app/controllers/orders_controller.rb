class OrdersController < ApplicationController

  def show
    @user = current_or_guest_user
    @address = @user.addresses.first
  end

  def mail_sending
    session[:order_id] = nil
    flash[:success] = "Your order is complete.  Email on the way!"
    redirect_to :root
  end

end
