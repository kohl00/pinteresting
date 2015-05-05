class AddUsersIdIndexToPins < ActiveRecord::Migration
  def change
  	add_index :pins, :user_id
  end
end
