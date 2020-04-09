class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :completed, :default => false
      t.integer :card_id 
      t.timestamps
    end
  end
end
