class AddUserIdToNarratives < ActiveRecord::Migration
  def change
  	add_column :narratives, :user_id, :integer
  	add_column :narratives, :event_id, :integer
  end
end
