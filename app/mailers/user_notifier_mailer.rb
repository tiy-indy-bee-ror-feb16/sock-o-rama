class UserNotifierMailer < ApplicationMailer
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def order_complete(sale)
    mail(:to => sale.email, :subject => 'Your money is now ours!' )
  end
end
