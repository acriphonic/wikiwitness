class AddIndexToNarrativesContent < ActiveRecord::Migration
  def change
  	add_index :narratives, :content, unique: true
  end
end
