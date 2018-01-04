class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.belongs_to :plant
      t.string :name, null: false
      t.string :description
      t.datetime :datetime, null: false

      t.timestamps
    end
  end
end
