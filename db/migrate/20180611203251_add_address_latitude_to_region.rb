class AddAddressLatitudeToRegion < ActiveRecord::Migration[5.0]
  def change
    add_column :regions, :address_latitude, :float
  end
end
