# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  password   :string(255)
#  email      :string(255)
#  name       :string(255)
#  account    :string(255)
#  dob        :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :account, :dob, :email, :name, :password, :username
end
