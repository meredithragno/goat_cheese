class AddTastingCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tastings_count, :integer
  end
end
