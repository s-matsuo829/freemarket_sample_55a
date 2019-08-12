class LikesController < ApplicationController
  before_action :set_item

  def create
    @like = current_user.likes.create(user_id: current_user.id, item_id: params[:item_id])
    @likes = Like.where(item_id: params[:item_id])
    @item.reload
  
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    @like.destroy
    @likes = Like.where(item_id: params[:item_id])
    @item.reload
    # redirect_back(fallback_location: root_path)
  end
  

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end