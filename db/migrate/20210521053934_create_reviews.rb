class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.text :content
      t.references :reviewable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
