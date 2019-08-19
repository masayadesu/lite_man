require 'rails_helper'

RSpec.feature "User", type: :feature do
  let(:user) {FactoryBot.create(:user)}

  scenario "会員登録をする" do
    visit root_path
    click_link "登録"
    fill_in "ユーザー名", with: user.name
    fill_in "email", with: user.email
    fill_in "パスワード", with: user.password
    fill_in "パスワード（確認）", with: user.password_confirmation
    click_button "作成"
    expect {
      expect(page).to have_content "ユーザー登録が完了しました"
      expect(page).to have_current_path "/literatures"
    }
  end
  scenario "ログインする" do
    visit root_path
    click_link "ログイン"
    fill_in "ユーザー名", with: user.name
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect {
      expect(page).to have_content "ログインしました"
      expect(page).to have_current_path "/literatures"
    }
  end
  scenario "ログアウトする" do
    visit root_path
    click_link "ログイン"
    fill_in "ユーザー名", with: user.name
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    click_link "ログアウト"
    expect {
      expect(page).to have_content "ログアウトしました"
      expect(page).to have_current_path "/"
      save_and_open_page
    }
  end
  scenario "会員登録を解除する" do
    visit root_path
    click_link "ログイン"
    fill_in "ユーザー名", with: user.name
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    visit account_path
    click_link "退会"
    expect {
      expect(page).to have_content "登録を解除しました"
      expect(page).to have_current_path "/"
    }
  end
end
