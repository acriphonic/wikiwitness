class AddImageUrlFieldToNarrative < ActiveRecord::Migration
  def up
  	add_column :narratives, :image_link, :string
  end

  def down
  	remove_column :narratives, :image_link
  end
end
