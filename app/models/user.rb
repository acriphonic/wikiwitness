class User < ActiveRecord::Base
  attr_accessible :acctype, :dob, :email, :name, :username
end
