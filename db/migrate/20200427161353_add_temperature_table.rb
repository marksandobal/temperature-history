class AddTemperatureTable < ActiveRecord::Migration[5.1]
  def change
    create_table :temperatures do |t|
      t.string :city
      t.string :temperature
      t.string :type_temperature

      t.timestamps
    end
  end
end
