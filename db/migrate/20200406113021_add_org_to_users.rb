class AddOrgToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :organisation_id, :integer
  end
end
