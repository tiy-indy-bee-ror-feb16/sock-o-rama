class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_paper_trail_whodunnit
  include GuestUser
  helper_method :current_user
  helper_method :current_order

  def current_order
    if session[:order_id].present?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_address
    if current_user
      Address.find(current_user.addresses.first.id)
    else
      @user = current_or_guest_user
      @user.addresses.last
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def get_user
    current_user || guest_user
  end

  def disallow_user
    if current_user
      flash[:info] = "You're already logged in"
      redirect_to :root
    end
  end

  def require_user
    unless current_user
      flash[:danger] = "You must be logged in to do that"
      redirect_to :root
    end
  end

end
