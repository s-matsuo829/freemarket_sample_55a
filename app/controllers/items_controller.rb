class ItemsController < ApplicationController

  def index
  end


  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
  end
  
  def new
  end

end
