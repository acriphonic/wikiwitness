# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  name       :string(255)
#  email      :string(255)
#  dob        :integer
#  acctype    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :acctype, :dob, :email, :name, :username, :password
  has_many :narratives
  validates_presence_of :username, :dob, :email, :name, :password
  validates_length_of :username, :in => 6..12, :message =>
  	"Please enter a username between 6 and 12 characters."
  validates_length_of :password, :in => 6..20, :message =>
  	"Please enter a username between 6 and 20 characters."
end
