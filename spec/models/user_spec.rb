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

require 'spec_helper'

describe User do
  
	before do
		@user = User.new(name: "Example User", email: "user@example.com",
			username: "exampleuser", password: "Examp1epassword", dob: 1970)
	end

	subject { @user }

	describe "fields should be populated" do
		it { should respond_to(:username) }
		it { should respond_to(:password) }
		it { should respond_to(:email) }
		it { should respond_to(:dob) }
		it { should be_valid }
	end

	describe "when username is not present" do
		before { @user.username = " " }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when password is not present" do
		before { @user.password = " " }
		it { should_not be_valid }
	end

	describe "when date of birth is not present" do
		before { @user.dob = " " }
		it { should_not be_valid }
	end

	describe "when username is too long" do
		before { @user.username = "a" * 16 }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
	    it "should be invalid" do
	      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
	                     foo@bar_baz.com foo@bar+baz.com]
	      addresses.each do |invalid_address|
	        @user.email = invalid_address
	        @user.should_not be_valid
	      end      
	    end
	end

	describe "when email format is valid" do
	    it "should be valid" do
	      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	      addresses.each do |valid_address|
	      	@user.email = valid_address
	      	@user.should be_valid
	      end
	    end
	end

	describe "when email address is already taken" do
	    before do
	      user_with_same_email = @user.dup
	      user_with_same_email.email = @user.email.upcase
	      user_with_same_email.save
	    end

	    it { should_not be_valid }
	end
end