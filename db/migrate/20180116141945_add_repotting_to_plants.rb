class AddRepottingToPlants < ActiveRecord::Migration[5.0]
  def up
    add_column :plants, :repotting_requirement, :string

    change_column :events, :description, :text
  end

  def down
    remove_column :plants, :repotting_requirement, :string

    change_column :events, :description, :string
  end
end
