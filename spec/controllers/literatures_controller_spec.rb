require 'rails_helper'

RSpec.describe LiteraturesController, type: :controller do
  before do
  end
  context "未ログイン" do
    describe "Get #index" do
      it "ログインページに遷移されること" do
        get :index
        expect(response).to redirect_to login_path
      end
    end

    describe "Get #show" do
      it "ログインページに遷移されること" do
        get :show, params: { id: 1 }
        expect(response).to redirect_to login_path
      end
    end

    describe "Get #show" do
      it "ログインページに遷移されること" do
        get :edit, params: { id: 1 }
        expect(response).to redirect_to login_path
      end
    end

    describe "Get #edit" do
      it "ログインページに遷移されること" do
        get :edit, params: { id: 1 }
        expect(response).to redirect_to login_path
      end
    end

    describe "Get #new" do
      it "ログインページに遷移されること" do
        get :new
        expect(response).to redirect_to login_path
      end
    end

    describe "Post#new" do
      it "ログインページに遷移されること" do
        post :new
        expect(response).to redirect_to login_path
      end
    end

    describe "Put#update" do
      it "ログインページに遷移されること" do
        put :update, params: { id: 1 }
        expect(response).to redirect_to login_path
      end
    end

    describe "Patch#update" do
      it "ログインページに遷移されること" do
        patch :update, params: { id: 1 }
        expect(response).to redirect_to login_path
      end
    end

    describe "Dlete#destroy" do
      it "ログインページに遷移されること" do
        delete :destroy, params: { id: 1 }
        expect(response).to redirect_to login_path
      end
    end
  end
  context "ログイン" do
    before do
      @user = FactoryBot.create(:user)


    end
    describe "Get#index" do
      it "200" do
        login( @user)
        get :index
        expect(response).to have_http_status "200"
      end
    end
  end
end
