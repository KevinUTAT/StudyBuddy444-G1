class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :category
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.text :location
      t.integer :capacity

      t.timestamps
    end
  end
end
