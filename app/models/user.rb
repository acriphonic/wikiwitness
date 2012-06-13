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
  after_initialize :init

  validates :username, presence: true, length: { minimum: 6 maximum: 15 }, uniqueness:
  	{ case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 maximum: 20 }, confirmation: true
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
  	format: { with: VALID_EMAIL_REGEX }, confirmation: true
  validates :email_confirmation, presence: true
  validates :dob, presence: true, numbericality: { only_integer: true, greater_than: 1895,
  	less_than: 2000 }, length: { is: 4 }

  def init
  	self.account = "BASIC"
  end
end
