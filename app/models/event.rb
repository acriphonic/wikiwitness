class Event < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date, :status, :summary
  has_many :narratives
  #validates :name, :length => { :maxiumum => 140 }
end
