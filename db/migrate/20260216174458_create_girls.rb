class CreateGirls < ActiveRecord::Migration[7.2]
  def change
    create_table :girls do |t|
      t.string :name
      t.integer :age
      t.string :city
      t.float :weight
      t.float :height
      t.string :chest_size
      t.string :body_type
      t.text :description

      t.timestamps
    end
  end
end
