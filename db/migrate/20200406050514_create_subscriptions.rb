class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
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
