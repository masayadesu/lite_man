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
    log_in(user)
    expect {
      expect(page).to have_content "ログインしました"
      expect(page).to have_current_path "/literatures"
    }
  end
  scenario "ログアウトする" do
    log_in(user)
    click_link "ログアウト"
    expect {
      expect(page).to have_content "ログアウトしました"
      expect(page).to have_current_path "/"

    }
  end
  scenario "会員登録を解除する" do
    log_in(user)
    visit account_path
    click_link "退会"
    expect {
      expect(page).to have_content "登録を解除しました"
      expect(page).to have_current_path "/"
    }
  end
  pending "マイアカウントにアクセスできる"
  pending "一般ユーザーはユーザー管理ページにはアクセスできない"
  pending "管理者ユーザーはユーザー管理ページにアクセスできる" 
end
