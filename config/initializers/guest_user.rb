# Code attributed to the dope ass brosephs at https://gist.github.com/3dd13/7718287

# User Stories:
#   To start shopping easily,
#   guest user wants to add items to shopping cart without signing up
#
#
# Code Explanation:
#   - a guest_user is created when new user arrives to your website, so that he could have his own shopping cart, and adding items to shopping cart.
#   - when the guest_user sign up, all items in the shopping cart should be transferred to the new signed up user account
#

module GuestUser
  extend ActiveSupport::Concern

  def current_or_guest_user
    if current_user
      if session[:guest_user_id]
        transfer_guest_user_records_to_logged_in_user
        guest_user.destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
     session[:guest_user_id] = nil
     guest_user
  end

  private

  def transfer_guest_user_records_to_logged_in_user
    if current_user.order
      guest_user_order = guest_user.order
      guest_user_order.order_items.each do |order_item|
        order_item.order_id = current_user.order.id
        order_item.save!
      end
      guest_user_order.destroy
    else
      order = guest_user.order
      order.user_id = current_user.id
      order.save!
    end

  end

  def create_guest_user
    u = User.new(:email => "guest_#{Time.now.to_i}#{rand(99)}@example.com")
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    u
  end
end
