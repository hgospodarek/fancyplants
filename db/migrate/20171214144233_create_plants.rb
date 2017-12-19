class CreatePlants < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.string :name, null: false
      t.string :scientific_name
      t.text :alternate_names, array:true, default: []
      t.string :description
      t.string :plant_type
      t.string :pot_type
      t.string :pot_size
      t.string :location
      t.string :soil
      t.string :fertilizer
      t.string :light_requirement
      t.string :fertilizer_requirement
      t.string :humidity_requirement
      t.string :water_requirement
      t.string :soil_requirement
      t.string :pruning_requirement
      t.string :temperature_range # is there a better way to do a range?
      t.string :zone
      t.string :origin
      t.string :dormancy_cycle
      t.string :bloom_cycle # like, monocarpic
      t.string :propagation_method

      t.timestamps
    end
  end
end
