class CreateRates < ActiveRecord::Migration[7.2]
  def change
    create_table :rates do |t|
      t.string :name
      t.decimal :rate_per_hour
      t.decimal :rate_short
      t.decimal :rate_full_night

      t.timestamps
    end
  end
end
