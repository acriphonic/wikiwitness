class Narrative < ActiveRecord::Base
  attr_accessible :content, :event_id, :location, :name, :user_id
end
