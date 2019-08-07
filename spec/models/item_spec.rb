require 'rails_helper'

describe Item do
  describe '#create' do
    it "factory_botのdataは登録できる" do
      item = build(:item)
      expect(item).to be_valid
    end
    it "priceが299以下では登録不可" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:item]).to include("is invalid")
    end
    it "priceが10000000以上では登録不可" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:item]).to include("is invalid")
    end
    it "priceが0から始まる数字では登録不可" do
      item = build(:item, price: 0300)
      item.valid?
      expect(item.errors[:item]).to include("is invalid")
    end
    it "priceが50000だと登録可能" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:item]).to include("is not valid")
    end
  end
end

# RSpec.describe Item, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


