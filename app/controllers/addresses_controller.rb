class AddressesController < ApplicationController
  before_action :current_or_guest_user

  def new
    user = get_user
    redirect_to order_path(current_order) if user.addresses.any?
    @address = Address.new
  end

  def create
    user = get_user
    @address = Address.new(address_params)
    @address.user = user
    if @address.save
      redirect_to order_path(current_order)
    else
      render :new
    end
  end

  def edit
    @address = current_address
  end

  def update
    @address = current_address
    @address.attributes = address_params
    if @address.save
      redirect_to order_path(current_order)
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :zip, :state, :name)
  end

end
