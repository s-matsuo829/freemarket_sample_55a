class Item < ApplicationRecord
  has_one :trading
  belongs_to :user
  has_many :likes, dependent: :destroy

  # reg_price_range = /[3-9]\d{2}|[1-9]\d{3,6}/

  validates :image,
    presence: true
  validates :name,
    presence: true,
    length: { maximum: 40 }
  validates :description,
    presence: true,
    length: { maximum: 1000 }
  validates :item_status,
    presence: true
  validates :payment,
    presence: true
  validates :delivery_type,
    presence: true
  validates :delivery_region,
    presence: true
  validates :delivery_days,
    presence: true
  validates :price,
    presence: true,

    # TO DO 価格の数値範囲のバリデーション一旦保留
    # format: { with: reg_price_range }

  mount_uploader { image: "ImageUploader" }
end
