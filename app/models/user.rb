# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  username        :string(255)
#  email           :string(255)
#  name            :string(255)
#  account         :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
	attr_accessible :email, :name, :password, :username, :password_confirmation
	
	has_many :narratives
	has_many :events, :through => :narratives
	has_many :recommendations

	has_secure_password
	VALID_USERNAME_REGEX = /\A[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*\z/
	validates :username, presence: true, length: { minimum: 6, maximum: 15 }, uniqueness:
		{ case_sensitive: false }, format: { with: VALID_USERNAME_REGEX }
	VALID_PASSWORD_REGEX = /\A(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E])*\z/
	validates :password, presence: true, length: { minimum: 6, maximum: 20 },
		format: { with: VALID_PASSWORD_REGEX }
	validates :password_confirmation, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false },
		format: { with: VALID_EMAIL_REGEX }

	before_save do |user| 
		user.email = email.downcase
		user.username = username.downcase
	end

	before_save :create_remember_token
	before_create :assign_account_type

	def self.search(search)
  		if search
  			find(:all, :conditions => ['username LIKE ? OR name LIKE ?',
  				"%#{search}%", "%#{search}%"])
  		else
  			find(:all)
  		end
  	end

	private
		def assign_account_type
			self.account = "admin"
		end

		def create_remember_token
		  	self.remember_token = SecureRandom.urlsafe_base64
		end
end
