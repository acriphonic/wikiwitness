class CreateNarratives < ActiveRecord::Migration
  def change
    create_table :narratives do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :name
      t.string :location
      t.string :content

      t.timestamps
    end
  end
end
