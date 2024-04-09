class Shoe < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :reviews, through: :orders, dependent: :destroy
  has_many :favourites
  has_many_attached :photos

  validates :name, :description, :price, :category, :size, presence: true

  include PgSearch::Model
pg_search_scope :search_by_name_and_size,
  against: [ :name, :size ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
