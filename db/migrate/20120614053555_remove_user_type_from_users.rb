class RemoveUserTypeFromUsers < ActiveRecord::Migration
  def up
		remove_column :users, :user_type
  end

  def down
		add_column :users, :users_type, :string 
  end
end
