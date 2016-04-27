class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 'user'
    if @user.save
      session[:user_id] = @user.id
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    else
      format.html { render :new }
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
