require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context "未ログイン" do
    describe "Get #top" do
      it "200レスポンスを返すこと" do
        get :top
        # expect(response).to be_successful
        expect(response).to have_http_status "200"
      end
    end
  end
end
