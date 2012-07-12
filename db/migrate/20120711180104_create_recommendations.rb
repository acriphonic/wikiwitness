class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :snippet
      t.integer :user_id
      t.integer :narrative_id
      t.timestamps
    end
  end
end
