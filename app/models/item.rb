class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  # has_many :comments, dependent: :destroy
  # has_many :favorites, dependent: :destroy


end
