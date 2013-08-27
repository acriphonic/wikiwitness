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
#  image_link :string(255)
#

class Narrative < ActiveRecord::Base
  attr_accessible :content, :location, :name, :image_link

  belongs_to :event
  belongs_to :user
  has_many :recommendations
  
  validates :content, presence: true, length: { minimum: 140 }
  validates :name, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
  validates :event_id, presence: true
  validates_uniqueness_of :user_id, :scope => :event_id

  def self.search(search)
    if search
      find(:all, :conditions => ['content LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%"])
  	else
  		find(:all)
  	end
  end
end
