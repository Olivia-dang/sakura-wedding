class CreateDresses < ActiveRecord::Migration[6.1]
  def change
    create_table :dresses do |t|
      t.string :name
      t.string :color
      t.string :size
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
