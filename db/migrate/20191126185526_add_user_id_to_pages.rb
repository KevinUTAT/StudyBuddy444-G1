class AddUserIdToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :user_id, :integer
  end
end
