class Machine < ApplicationRecord
  belongs_to :owner
  has_many :snack_locations
  has_many :snacks, through: :snack_locations
end
