class AddDurationToGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :start_time
    remove_column :groups, :end_time
    add_column :groups, :date, :date
    add_column :groups, :time, :time
    add_column :groups, :duration, :integer
  end
end
