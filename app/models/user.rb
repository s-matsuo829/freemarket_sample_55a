class User < ApplicationRecord

  has_many :sns_credentials, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_one :address

  reg_mail_address = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/
  reg_alphanumeric_6characters = /\A[a-zA-Z0-9]{6,}+\z/
  # reg_prefecture_choce = /\A(?!.*--未選択--).*\z/
  reg_only_kana = /\A[ァ-ヴ]+\z/
  # reg_zip_code = /\A[0-9]{3}\-[0-9]{4}+\z/
  # reg_intger_10or11_characters = /\A[0-9]{10,11}+\z/
  # reg_intger_14or16_characters = /\A[0-9]{14,16}+\z/
  # reg_intger_3or4_characters = /\A[0-9]{3,4}+\z/
  reg_date_year = /\A\d{4}-\d{2}-\d{2}\z/

  validates :nickname,
    presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: reg_mail_address }
  validates :password,
    presence: true,
    confirmation: true,
    format: { with: reg_alphanumeric_6characters }
  validates :first_name,
    presence: true
  validates :last_name,
    presence: true
  validates :first_kana,
    presence: true,
    format: { with: reg_only_kana }
  validates :last_kana,
    presence: true,
    format: { with: reg_only_kana }
  validates :birthday,
    presence: true,
    format: { with: reg_date_year }


  

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
      unless user.present?
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential
    else 
      user = User.where(email: auth.info.email).first
      if user.present? 
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else 
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
        sns = SnsCredential.new(
          uid: uid,
          provider: provider
        )
      end
    end
    return { user: user ,sns: sns}
  end

end
