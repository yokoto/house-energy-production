class CreateEnergies < ActiveRecord::Migration[6.0]
  def change
    create_table :energies do |t|
      t.integer :label
      t.integer :house_id
      t.integer :year
      t.integer :month
      t.decimal :temperature
      t.decimal :daylight
      t.integer :energy_production

      t.timestamps
    end
  end
end
