class ChangeSubscriptions < ActiveRecord::Migration[5.2]

  def up
  	drop_table :subscriptions

    create_table :subscriptions do |t|
      t.string :title
      t.string :description
      t.integer :minimum_users
      t.boolean :unlimited_boards
      t.float :board_cost
      t.boolean :additional_users
      t.float :cost_per_add_user
      t.float :basic_cost
      t.timestamps
    end
  end


  def down
  	drop_table :subscriptions
    create_table :subscriptions do |t|
      t.string :title
      t.string :description
      t.integer :number_of_users
      t.float :monthly_rate
      t.float :additional_user_rate
      t.float :unlimited_board_rate

      t.timestamps
    end
  end

end
