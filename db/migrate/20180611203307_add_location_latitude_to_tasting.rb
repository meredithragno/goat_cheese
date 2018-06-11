class AddLocationLatitudeToTasting < ActiveRecord::Migration[5.0]
  def change
    add_column :tastings, :location_latitude, :float
  end
end
