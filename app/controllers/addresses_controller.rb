class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:edit, :update]
  before_action :check_user, only: [:edit, :update]

  def new
    @address = Address.new
    @user = current_user
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

  def edit
  end

  def update
  end

  private

  def address_params
    params.permit(:postalcode, :prefecture, :city, :number, :building, :phone_number).merge(user_id: current_user.id)
  end

  def set_address
    @user = current_user
    @address = current_user.address
  end

  def check_user
    redirect_to root_path unless @address.user_id == current_user.id
  end

end
