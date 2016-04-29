class AddressesController < ApplicationController

  def new
    @address = current_user.addresses.first || Address.new
    redirect_to edit_address_path(@address) if current_user.addresses.first
  end

  def create

  end
end
