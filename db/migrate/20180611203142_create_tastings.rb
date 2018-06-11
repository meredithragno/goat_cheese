class CreateTastings < ActiveRecord::Migration
  def change
    create_table :tastings do |t|
      t.integer :cheeses_id
      t.integer :user_id
      t.string :location
      t.text :notes
      t.integer :producers_id
      t.integer :rating

      t.timestamps

    end
  end
end
