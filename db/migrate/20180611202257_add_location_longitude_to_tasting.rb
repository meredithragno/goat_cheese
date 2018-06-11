class AddLocationLongitudeToTasting < ActiveRecord::Migration[5.0]
  def change
    add_column :tastings, :location_longitude, :float
  end
end
