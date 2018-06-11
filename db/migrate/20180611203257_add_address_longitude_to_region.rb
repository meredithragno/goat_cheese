class AddAddressLongitudeToRegion < ActiveRecord::Migration[5.0]
  def change
    add_column :regions, :address_longitude, :float
  end
end
