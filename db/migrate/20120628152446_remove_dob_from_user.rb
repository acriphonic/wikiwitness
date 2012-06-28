class RemoveDobFromUser < ActiveRecord::Migration
  def up
  	remove_column :users, :dob
  end

  def down
  end
end
