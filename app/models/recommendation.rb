# == Schema Information
#
# Table name: recommendations
#
#  id           :integer         not null, primary key
#  snippet      :string(255)
#  user_id      :integer
#  narrative_id :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Recommendation < ActiveRecord::Base
  attr_accessible :snippet

  belongs_to :narrative
  belongs_to :user

  validates :snippet, length: { maximum: 255 }
  validates_presence_of :narrative_id
  validates_uniqueness_of :user_id, :scope => :narrative_id
end
