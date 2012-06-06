class Narrative < ActiveRecord::Base
  attr_accessible :content, :event_id, :location, :name, :user_id
  belongs_to :user
  belongs_to :event
  validates_presence_of :content, :name
end
