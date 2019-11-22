class CreatePostApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :post_applications do |t|
      t.string :applicant_username
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
