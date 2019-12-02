class AddIsAcceptedToPostAndPostApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :is_accepting_applicants, :boolean, default: true
    add_column :post_applications, :is_accepted, :boolean, default: false

  end
end
