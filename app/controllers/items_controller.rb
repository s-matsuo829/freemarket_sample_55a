class ItemsController < ApplicationController

  def index
  end


  def show
  end
  
  def new
    @item = Item.new
  end

  def create
    # @item = Item.new(
    #   image: item_params[:image],
    #   name: item_params[:name],
    #   description: item_params[:description],
    #   item_status: item_params[:item_status],
    #   delivery_type: item_params[:delivery_type],
    #   payment: 1,
    #   delivery_region: item_params[:delivery_region],
    #   delivery_days: item_params[:delivery_days],
    #   price: item_params[:price],
    #   user_id: 1
    # )
    # if @item.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
    # binding.pry
    Item.create(
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
    # redirect to
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :item_status, :payment, :delivery_type, :delivery_region, :delivery_days, :price).merge(user_id: 1)
    # params.require(:item).permit(:image, :name, :description, :payment, :delivery_type, :delivery_region, :delivery_days, :price).merge(user_id: 1).merge(item_status: params[:item][:item_status].to_i )
  end
  # end

end
