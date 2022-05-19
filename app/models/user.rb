class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name , presence: true

  mount_uploader :image, ImageUploader

  has_many :items, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # has_many :favorites, dependent: :destroy

end
