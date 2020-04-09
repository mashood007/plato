class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.string :parent_id
      t.references :board, foreign_key: true
      t.integer :created_by
      t.timestamps
    end
  end
end
