class ItemsController < ApplicationController

  def index
  end


  def show
  end
  
  def new
  end

  def purchase_confirmation

    @item = Item.find(params[:id])
    @address = @item.user.address
    @user = @item.user

  end


  def payment_complete
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: params[:amount],
    card:params['payjp-token'],
    currency: 'jpy'
    )
    redirect_to payment_complete_item_path
  end
end
