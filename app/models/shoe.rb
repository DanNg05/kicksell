class Shoe < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :reviews, through: :orders, dependent: :destroy
  has_many :favourites
  has_many_attached :photos

  validates :name, :description, :price, :category, :size, presence: true

end
