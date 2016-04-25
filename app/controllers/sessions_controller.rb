class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user
      flash[:success] = "Logged in successfully"
      redirect_to :root
    else
      flash[:danger] = "Incorrect email / password combo"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out successfully"
    redirect_to :root
  end

end
