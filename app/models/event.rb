class Event < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date, :status, :summary
  has_many :narratives
  validates_presence_of :start_date, :name
end
