class AddressesController < ApplicationController

  def new
    @address = current_user.address || Address.new
    redirect_to edit_address_path(@address) if current_user.address
  end

  def create

  end
end
