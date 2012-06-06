class Narrative < ActiveRecord::Base
  attr_accessible :content, :event_id, :location, :name, :user_id
  belongs_to :user
  belongs_to :event
  #validates :name, :length => { :maxiumum => 140 }
end
