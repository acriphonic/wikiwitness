class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :startdate
      t.date :enddate
      t.string :status
      t.string :summary

      t.timestamps
    end
  end
end
