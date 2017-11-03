class Snack < ApplicationRecord
  has_many :snack_locations
  has_many :machines, through: :snack_locations
end
