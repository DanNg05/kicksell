class Review < ApplicationRecord
  belongs_to :order
  validates :content, :rating, presence: true
end
