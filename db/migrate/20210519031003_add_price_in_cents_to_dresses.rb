class AddPriceInCentsToDresses < ActiveRecord::Migration[6.1]
  def change
    add_column :dresses, :price_in_cents, :integer
  end
end
