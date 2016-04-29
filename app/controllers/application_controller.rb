class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_order

  def current_order
    if session[:order_id].present?
      Order.find(session[:order_id])
    else
      Order.new
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
