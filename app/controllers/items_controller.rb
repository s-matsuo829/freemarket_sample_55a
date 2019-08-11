class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :show_all]
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit]

  def index
    @items = Item.limit(4).order("created_at DESC")
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
      user_id: current_user.id
    )
    if @item.save
      @trading = Trading.create(
        item_id: @item.id,
        status: 0,
        rating: "",
        buyer_id: current_user.id
      )
      redirect_to :root and return
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.user_id == current_user.id
      @item.update(
        image: item_params[:image] ? item_params[:image] : @item.image,
        name: item_params[:name],
        description: item_params[:description],
        item_status: item_params[:item_status],
        payment: @item.payment,
        delivery_type: item_params[:delivery_type],
        delivery_region: item_params[:delivery_region],
        delivery_days: item_params[:delivery_days],
        price: item_params[:price]
      )
      redirect_to item_path(@item.id)
    else
      redirect_to item_path(@item.id)
    end
  end

  def destroy
    @item.destroy if @item.user_id == current_user.id
    redirect_to root_path
  end

  def show_all
    @items = Item.all.limit(20).order("created_at DESC")
  end

  def show_user_all
    @items = current_user.items.limit(20).order("created_at DESC")
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :item_status, :payment, :delivery_type, :delivery_region, :delivery_days, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    redirect_to root_path unless @item.user_id == current_user.id
  end

end
