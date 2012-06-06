class User < ActiveRecord::Base
  attr_accessible :acctype, :dob, :email, :name, :username
  has_many :narratives
  validates_presence_of :username, :dob, :email, :name
  validates_length_of :username, :in => 6..12, :message => "OHNOES"
end
