require 'rails_helper'

describe User do
  describe '#create' do
    it "nicknameが空では登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end