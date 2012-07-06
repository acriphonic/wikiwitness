class AddContentToNarratives < ActiveRecord::Migration
  def up
  	add_column :narratives, :content, :text
  	add_index :narratives, :content
  end

  def down
  	remove_column :narratives, :content
  end
end
