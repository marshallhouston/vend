class SnackLocation < ApplicationRecord
  belongs_to :snack
  belongs_to :machine
end
