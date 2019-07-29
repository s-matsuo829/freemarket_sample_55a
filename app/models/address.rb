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
  
end
