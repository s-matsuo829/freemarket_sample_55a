require 'rails_helper'

describe User do
  describe '#create' do
    it "factory_botのdataは登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameが空では登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "emailが空では登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "emailが重複すると登録できない" do
      create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it "emailが@を含まないと登録できない " do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailの@の前に文字がないと登録できない " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailの@の後に文字がないと登録できない" do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailに英数字と記号以外の文字が含まれると登録できない" do
      user = build(:user, email: "aaあa@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
  end
end