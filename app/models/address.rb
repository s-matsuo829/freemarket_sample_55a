class Address < ApplicationRecord
  reg_postalcode = /\A[0-9]{3}\-[0-9]{4}+\z/
  reg_intger_10or11_characters = /\A[0-9]{10,11}+\z/

  validates :postalcode,
    presence: true,
    format: { with: reg_postalcode }
  with_options presence: true do
    validates :prefecture
    validates :city
    validates :number
  end
  validates :phone_number,
    presence: true, 
    uniqueness: true,
    format: { with: reg_intger_10or11_characters }
  
  enum prefecture: %w(-- 北海道 青森県 岩手県 宮城県 秋田県 山形県 福島県 東京都 神奈川県 埼玉県 千葉県 茨城県 栃木県 群馬県 山梨県 新潟県 長野県 富山県 石川県 福井県 愛知県 岐阜県 静岡県 三重県 大阪府 兵庫県 京都府 滋賀県 和歌山県 鳥取県 島根県 岡山県 広島県 山口県 徳島県 香川県 愛媛県 高知県 福岡県 佐賀県 長崎県 熊本県 大分県 宮崎県 鹿児島県 沖縄県)
  
end