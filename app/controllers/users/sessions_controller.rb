# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # サインイン後のリダイレクト先をマイページへ
  # def after_sign_in_path_for(resource)
  #   # flash[:notice] = "ログインに成功しました" #　 <-任意で
  #   user_path(current_user.id)  #　指定したいパスに変更
  # end

  # サインアウト後のリダイレクト先をトップページへ
  def after_sign_out_path_for(resource)
      # flash[:alert] = "ログアウトしました"
      root_path
  end
end
