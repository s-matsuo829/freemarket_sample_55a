class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:signup]

  def show
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

  def purchase_confirmation
  end
end
