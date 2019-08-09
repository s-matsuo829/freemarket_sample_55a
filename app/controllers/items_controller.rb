class ItemsController < ApplicationController

  def index
  end


  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
  
    good_trades = Trading.where(item_id: @user.items.ids, rating: 0)
    @number_of_goods = good_trades.count
    normal_trades = Trading.where(item_id: @user.items.ids, rating: 1)
    @number_of_normals = normal_trades.count
    bad_trades = Trading.where(item_id: @user.items.ids, rating: 2)
    @number_of_bads = bad_trades.count
    binding.pry
  end
  
  def new
  end

end
