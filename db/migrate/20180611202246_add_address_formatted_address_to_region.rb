class AddAddressFormattedAddressToRegion < ActiveRecord::Migration[5.0]
  def change
    add_column :regions, :address_formatted_address, :string
  end
end
