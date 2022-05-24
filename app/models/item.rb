class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_many :favorite_users, through: :favorites, source: :user

  with_options presence: true do
    validates :image
    validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 99, message: 'は半角数字で入力してください' },
                    format: { with: /\A[0-9]+\z/ }
    validates :text, length: { maximum: 200 }
  end

  validates :material, length: { maximum: 200 }
  validates :making, length: { maximum: 200 }
end
