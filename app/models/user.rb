class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invaild. Input full-width characters' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invaild. Input full-width characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invaild. Input full-width katakana characters' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invaild. Input full-width katakana characters' }
    validates :birthday
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  validates :password, presence: true,
                       format: { with: VALID_PASSWORD_REGEX }

  has_many :items
end
