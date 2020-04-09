class CreateOrganisations < ActiveRecord::Migration[5.2]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :location
      t.integer :number_of_users
      t.integer :subscription_id
      t.integer :number_of_boards
      t.timestamps
    end
  end
end
