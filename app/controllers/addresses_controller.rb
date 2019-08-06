class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to new_user_card_path(current_user.id), notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def show
  end

  private

  def address_params
    params.permit(:postalcode, :prefecture, :city, :number, :building, :phone_number).merge(user_id: current_user.id)
  end

end
