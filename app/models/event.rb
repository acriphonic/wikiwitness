# == Schema Information
#
# Table name: events
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  start_date :date
#  end_date   :date
#  status     :string(255)
#  summary    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Event < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date, :status, :summary
  has_many :narratives
  validates_presence_of :start_date, :name
end
