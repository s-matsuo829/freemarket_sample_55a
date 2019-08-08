require 'rails_helper'

describe ItemsController do
  before do
    # テーブルにレコードを保存しておく
    @user = create(:user)
    # @another_user = FactoryBot.create(:another_user)
    @item = create(:item)
  end

  describe 'GET #edit' do
    it "インスタンスの変数の値を確認する" do
      # 擬似的にeditアクションを動かすリクエストを行う
      get :edit, params: {  id: @item.id }
      # editアクションで取得したインスタンス変数が、変数itemと一致するか確認
      expect(assigns(:item)).to eq @item
    end
    it "期待したビューに遷移するか" do
      # 擬似的にeditアクションを動かすリクエストを行う
      get :edit, params: {  id: @item }
      # edit.html.hamlに遷移することを確かめる
      expect(response).to render_template :edit
    end
  end

  # describe "#update" do
  #   context "正規のユーザーの場合" do
  #     it "正常に商品を更新できるか？" do
  #       item_params = {title: "うんこちゃん"}
  #       patch :update, params: {id: @article.id, article: article_params}
  #       expect(@article.reload.title).to eq "うんこちゃん"
  #     end
  #     # 記事を更新した後、更新された記事の詳細ページへリダイレクトするか？
  #     it "redirects the page to /articles/article.id(1)" do
  #       sign_in @user
  #       article_params = {title: "うんこちゃん"}
  #       patch :update, params: {id: @article.id, article: article_params}
  #       expect(response).to redirect_to "/articles/1"
  #     end
  #   end
  #   context "with invalid attributes" do
  #     # 不正なアトリビュートを含む記事は更新できなくなっているか？
  #     it "does not update an article" do
  #       sign_in @user
  #       article_params = {title: nil}
  #       patch :update, params: {id: @article.id, article: article_params}
  #       expect(@article.reload.title).to eq "加藤純一"
  #     end
  #     # 不正な記事を更新しようとすると、再度更新ページへリダイレクトされるか？
  #     it "redirects the page to /articles/article.id(1)/edit" do
  #       sign_in @user
  #       article_params = {title: nil}
  #       patch :update, params: {id: @article.id, article: article_params}
  #       expect(response).to redirect_to "/articles/1/edit"
  #     end
  #   end
  #   context "as an unauthorized user" do
  #     # 正常なレスポンスが返ってきていないか？
  #     it "does not respond successfully" do
  #       sign_in @another_user
  #       get :edit, params: {id: @article.id}
  #       expect(response).to_not be_success
  #     end
  #     # 他のユーザーが記事を編集しようとすると、ルートページへリダイレクトされているか？
  #     it "redirects the page to root_path" do
  #       sign_in @another_user
  #       get :edit, params: {id: @article.id}
  #       expect(response).to redirect_to root_path
  #     end
  #   end
  #   context "as a guest user" do
  #     # 302レスポンスを返すか？
  #     it "returns a 302 response" do
  #       article_params = {
  #         title: "加藤純一",
  #         text: "加藤純一？　神",
  #         user_id: 1
  #       }
  #       patch :update, params: {id: @article.id, article: article_params}
  #       expect(response).to have_http_status "302"
  #     end
  #     # ログイン画面にリダイレクトされているか？
  #     it "redirects the page to /users/sign_in" do
  #       article_params = {
  #         title: "加藤純一",
  #         text: "加藤純一？　神",
  #         user_id: 1
  #       }
  #       patch :update, params: {id: @article.id, article: article_params}
  #       expect(response).to redirect_to "/users/sign_in"
  #     end
  #   end
  # end
end