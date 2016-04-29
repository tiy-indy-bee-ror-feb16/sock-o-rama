class UserNotifierMailer < ApplicationMailer
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def order_complete(order)
    @sock = order.order_items
    mail(:to => order.email, :subject => 'Your money is now ours!' )
  end
end
