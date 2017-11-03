class CreateSnackLocation < ActiveRecord::Migration[5.1]
  def change
    create_table :snack_locations do |t|
      t.belongs_to :snack, index: true
      t.belongs_to :machine, index: true
    end
  end
end
