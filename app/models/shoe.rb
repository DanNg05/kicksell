class Shoe < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :reviews, through: :orders, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many_attached :photos

  validates :name, :description, :category, :size, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  include PgSearch::Model
pg_search_scope :search_by_name_and_size,
  against: [ :name, :size ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
