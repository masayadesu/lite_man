module LoginSupport
  def log_in(user)
    visit root_path
    click_link "ログイン"
    fill_in "ユーザー名", with: user.name
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end
  def log_out
    click_link "ログアウト"
  end
end
#
# RSpec.configure do|config|
#   config.include LoginSupport
# end
