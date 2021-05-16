class AddUserRefToDresses < ActiveRecord::Migration[6.1]
  def change
    add_reference :dresses, :user, null: false, foreign_key: true
  end
end
