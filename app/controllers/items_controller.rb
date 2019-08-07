class ItemsController < ApplicationController

  def index
    @items = Item.limit(4).order("created_at DESC")
  end


  def show
  end
  
  def new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.update(
        image: item_params[:image],
        name: item_params[:name],
        description: item_params[:description],
        item_status: item_params[:item_status].to_i,
        payment: item_params[:payment].to_i,
        delivery_type: item_params[:delivery_type].to_i,
        delivery_region: item_params[:delivery_region].to_i,
        delivery_days: item_params[:delivery_days].to_i,
        price: item_params[:price]
      )
      redirect_to item_path(@item.id)
    else
      render item_path(item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :item_status, :payment, :delivery_type, :delivery_region, :delivery_days, :price).merge(user_id: current_user.id)
  end

end
