require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end
  # let(:user) { create(:user) }
  context "未ログイン" do
    describe "Get #new" do
      it "200レスポンスを返すこと" do
        get :new
        expect(response).to have_http_status "200"
      end
    end

    describe "Post #create" do
      # it "200レスポンスを返すこと" do
      #   user_params = @users
      #   post :create, params: {user: user_params}
      #   expect(response).to have_http_status "200"
      # end
      # let(:param) do
      #   {
      #     users: {
      #       name: "passion",
      #       email: "passion@example.com",
      #       password: "password ",
      #       administrator: "false"
      #     }
      #   }
      # end
      # expect(response).to have_http_status "200"
    end
  end
end
