class CreateSushis < ActiveRecord::Migration[8.0]
  def change
    create_table :sushis do |t|
      t.string :name, null: false
      t.integer :price, null:false
      t.text :description

      t.timestamps
    end
  end
end
