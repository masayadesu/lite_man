require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メールアドレス、パスワードがあれば有効な状態であること"  do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前がなければ無効な状態であること" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください", "は小文字英数字で入力してください")
  end

  it "重複した名前なら無効な状態であること" do
    FactoryBot.create(:user, name: "passion")
    user = FactoryBot.build(:user, name:"passion")
    user.valid?
    expect(user.errors[:name]).to include("はすでに存在します")
  end

  it "名前は20文字以内でなければ無効な状態であること" do
    # user = User.new(name: "#{'a'* 21}")
    user = FactoryBot.build(:user, name: "#{'a'* 21}")
    user.valid?
    expect(user.errors[:name]).to include("は20文字以内で入力してください")
  end
  it "メールアドレスがなければ無効な状態であること" do
    # user = User.new(email: nil)
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください", "は不正な値です")
  end

  it "重複したメールアドレスなら無効な状態であること" do
    FactoryBot.create(:user, email: "passion@example.com")
    user = FactoryBot.build(:user, email: "passion@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "メールアドレスは50文字以内でなければ無効な状態であること" do
    user = FactoryBot.build(:user, email: "#{'a'* 51}")
    user.valid?
    expect(user.errors[:email]).to include("は50文字以内で入力してください")
  end

  it "パスワードがなければ無効な状態であること" do
    # user = User.new( password: nil )
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "パスワードは6文字以上なければ無効な状態であること" do
    # user = User.new( password: "#{'a'* 5}" )
    user = FactoryBot.build(:user, password: "#{'a'* 5}")
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end
end
