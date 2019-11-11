class AddAttributesToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :title, :string
    add_column :notes, :course, :string
    add_column :notes, :content, :text
  end
end
