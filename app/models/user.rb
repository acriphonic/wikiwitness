class User < ActiveRecord::Base
  attr_accessible :acctype, :dob, :email, :name, :username
  has_many :narratives
  #validates :username, :length => { :maxiumum => 20 }
end
