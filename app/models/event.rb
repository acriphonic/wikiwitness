# == Schema Information
#
# Table name: events
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  startdate  :date
#  enddate    :date
#  status     :string(255)
#  summary    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Event < ActiveRecord::Base
  attr_accessible :enddate, :name, :startdate, :status, :summary
  has_many :narratives
  has_many :users, :through => :narratives

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :status, presence: true
  validates :startdate, presence: true
end
