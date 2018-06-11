class AddLocationFormattedAddressToTasting < ActiveRecord::Migration[5.0]
  def change
    add_column :tastings, :location_formatted_address, :string
  end
end
