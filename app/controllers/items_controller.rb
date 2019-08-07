class ItemsController < ApplicationController

  def index
  end


  def show
  end
  
  def new
    @item = Item.new
  end

  def create
    binding.pry
    Item.create(item_params)
    # redirect to
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :item_status, :payment, :delivery_type, :delivery_region, :delivery_days, :price)
  end

end
