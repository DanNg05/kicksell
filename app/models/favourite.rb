class Favourite < ApplicationRecord
  belongs_to :shoe
  belongs_to :user
  validates :user_id, uniqueness: {scope: :shoe_id}
end
