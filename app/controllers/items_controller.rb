class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]

  def index
    @items = Item.limit(4).order("created_at DESC")
  end

  def show
  end
  
  def new
  end

  def edit
  end

  def update
    if @item.user_id == current_user.id
      @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render item_path(item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :item_status, :payment, :delivery_type, :delivery_region, :delivery_days, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
