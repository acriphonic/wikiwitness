# == Schema Information
#
# Table name: narratives
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  location   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer
#  event_id   :integer
#  content    :text
#

class Narrative < ActiveRecord::Base
  attr_accessible :content, :location, :name

  audited :associated_with => :user

  belongs_to :event
  belongs_to :user
  
  validates :content, presence: true, length: { minimum: 140 }
  validates :name, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
  validates :event_id, presence: true
  validates_uniqueness_of :user_id, :scope => :event_id

  default_scope order: 'narratives.created_at DESC'

  def self.search(search)
    if search
  		find(:all, :conditions => ['content LIKE ?', "%#{search}%"])
  	else
  		find(:all)
  	end
  end
end