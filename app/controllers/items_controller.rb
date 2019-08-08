class ItemsController < ApplicationController

  def index
  end


  def show
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(
      image: item_params[:image],
      name: item_params[:name],
      description: item_params[:description],
      item_status: item_params[:item_status],
      delivery_type: item_params[:delivery_type],
      payment: 1,
      delivery_region: item_params[:delivery_region],
      delivery_days: item_params[:delivery_days],
      price: item_params[:price],
      user_id: 1
    )

    if @item.save
      @trading = Trading.create(
        item_id: @item.id,
        status: 0,
        rating: "",
        buyer_id: 1
      )
      redirect_to :root and return
    else
      render :new
    end



  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :item_status, :payment, :delivery_type, :delivery_region, :delivery_days, :price).merge(user_id: 1)
  end

end
