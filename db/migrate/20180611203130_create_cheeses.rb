class CreateCheeses < ActiveRecord::Migration
  def change
    create_table :cheeses do |t|
      t.string :name
      t.string :milk
      t.string :age
      t.string :variety
      t.integer :regions_id
      t.integer :producers_id

      t.timestamps

    end
  end
end
