class ItemsController < ApplicationController

  def index
  end


  def show
  end
  
  def new
  end

  def purchase_confirmation
  end

  def pay
      Payjp.api_key = 'sk_test_77779f0a6a5367800572e635'
      charge = Payjp::Charge.create(
        :amount => @item.price,
        :card => params['payjp-token'],
        :currency => 'jpy',
      )
  end
end
