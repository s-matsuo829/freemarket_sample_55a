require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "httpのレスポンスが問題なく成功している" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "httpのレスポンスが問題なく成功している" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
