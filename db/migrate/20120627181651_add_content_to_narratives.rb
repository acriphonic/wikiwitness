class AddContentToNarratives < ActiveRecord::Migration
  def up
  	remove_column :narratives, :content
  end
  
  def down
  	add_column :narratives, :content, :text
  	add_index :narratives, :content
  end
end
