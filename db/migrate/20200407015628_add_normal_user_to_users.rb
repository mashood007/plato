class AddNormalUserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :normal_user, :boolean, :default => false
  end
end
