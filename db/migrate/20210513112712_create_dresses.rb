class CreateDresses < ActiveRecord::Migration[6.1]
  def change
    create_table :dresses do |t|
      t.string :name, null: false
      t.string :color
      t.string :size
      t.text :description
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
