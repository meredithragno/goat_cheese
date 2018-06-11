class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.integer :regions_id
      t.string :name

      t.timestamps

    end
  end
end
