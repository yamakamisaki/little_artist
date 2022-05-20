class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :items, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :name, length: { maximum: 10 }
    # 英字、数字が含まれている場合のみ許可する
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end

  validates :profile, length: { maximum: 150 }
end
