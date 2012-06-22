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
	attr_accessible :dob, :email, :name, :password, :username, :password_confirmation

	has_secure_password

	VALID_USERNAME_REGEX = /^[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*$/
	validates :username, presence: true, length: { minimum: 6, maximum: 15 }, uniqueness:
		{ case_sensitive: false }, format: { with: VALID_USERNAME_REGEX }
	VALID_PASSWORD_REGEX = /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E])*$/
	validates :password, presence: true, length: { minimum: 6, maximum: 20 },
		format: { with: VALID_PASSWORD_REGEX }
	validates :password_confirmation, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false },
		format: { with: VALID_EMAIL_REGEX }
	validates :dob, presence: true, numericality: { only_integer: true, greater_than: 1895,
		less_than: 2000 }

	before_save do |user| 
		user.email = email.downcase
		user.username = username.downcase
		user.account = "basic"
	end

	before_save :create_remember_token

	private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
