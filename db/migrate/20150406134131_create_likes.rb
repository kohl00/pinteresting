class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :user_id
      t.string :pin_id

      t.timestamps
    end
    add_index :likes, [:user_id, :pin_id], unique: true
  end
end
