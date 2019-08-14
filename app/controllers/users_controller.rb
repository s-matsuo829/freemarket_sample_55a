class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:signup]

  def show
    @items = current_user.items
  end

  def edit
  end

  def mypage_identification
  end


  def signup
  end

  def signup_complete
  end

  def telephone_authentication
  end

  def logout
  end

end
