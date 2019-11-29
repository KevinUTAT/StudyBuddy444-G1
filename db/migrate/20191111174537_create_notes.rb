class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
        t.string :title
        t.string :course
        t.string :prof
        t.text :content
        
        t.timestamps
    end
  end
end
