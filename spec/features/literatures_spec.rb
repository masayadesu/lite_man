require 'rails_helper'

RSpec.feature "Literature", type: :feature do
  let(:user) {FactoryBot.create(:user)}
    scenario "新しい文献を作成する" do
      visit root_path
      click_link "ログイン"
      fill_in "ユーザー名", with: user.name
      fill_in "パスワード", with: user.password
      click_button "ログイン"

      expect {
        click_link "新規作成"
        fill_in "著者", with: "Test author"
        fill_in "タイトル/論文/記事名", with: "Test title"
        click_button "保存"
        expect(page).to have_content "文献を追加しました"
        # save_and_open_page
      }.to change(user.literatures,:count ).by(1)
      # }.to change{Literature.count}.by(1)
    end

    scenario "文献を削除する" do
      visit root_path
      click_link "ログイン"
      fill_in "ユーザー名", with: user.name
      fill_in "パスワード", with: user.password
      click_button "ログイン"

      expect {
        click_link "新規作成"
        fill_in "著者", with: "Test author2"
        fill_in "タイトル/論文/記事名", with: "Test title2"
        click_button "保存"
        click_link "削除"

        expect(page).to have_content "文献が削除されました"
      }
    end


    scenario "存在しない文献ページにアクセスするとActiveRecord::RecordNotFound" do
      visit root_path
      click_link "ログイン"
      fill_in "ユーザー名", with: user.name
      fill_in "パスワード", with: user.password
      click_button "ログイン"

      expect {
        visit "/literatures/500"
        expect(page).to have_content "ActiveRecord::RecordNotFound in LiteraturesController#show"
      }
    end
end
