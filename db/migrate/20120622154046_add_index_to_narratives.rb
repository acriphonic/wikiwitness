class AddIndexToNarratives < ActiveRecord::Migration
  def change
  	add_index :narratives, [:user_id, :created_at]
  	add_index :narratives, [:event_id, :created_at]
  end
end
