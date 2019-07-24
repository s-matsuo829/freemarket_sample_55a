class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_kana
    validates :last_kana
    validates :birthday
  end
end
