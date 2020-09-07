class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANANAME_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/

  validates :nickname, presence: true
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'must include both letters and numbers'  }
  devise :validatable, password_length: 6..128
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'must be Full-width characters' }
  validates :family_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'must be Full-width characters' }
  validates :kana_first_name, presence: true, format: { with: VALID_KANANAME_REGEX, message: 'must be Full-width katakana characters' }
  validates :kana_family_name, presence: true, format: { with: VALID_KANANAME_REGEX, message: 'must be Full-width katakana characters' }
  validates :birthday, presence: true
  
  has_many :items
  has_many :purchases

end
