# == Schema Information
#
# Table name: narratives
#
#  id         :integer         not null, primary key
#  event_id   :integer
#  user_id    :integer
#  name       :string(255)
#  location   :string(255)
#  content    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Narrative < ActiveRecord::Base
  attr_accessible :content, :event_id, :location, :name, :user_id
  belongs_to :user
  belongs_to :event
  validates_presence_of :content, :name
end
