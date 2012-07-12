class AddIndexToRecommendations < ActiveRecord::Migration
  def change
  	add_index :recommendations, [:user_id, :created_at]
  	add_index :recommendations, [:narrative_id, :created_at]
  end
end
