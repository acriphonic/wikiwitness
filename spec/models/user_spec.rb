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
			username: "exampleuser", password: "Examp1epassword", 
			password_confirmation: "Examp1epassword", dob: 1970)
	end

	subject { @user }

	describe "fields should be populated" do
		it { should respond_to(:username) }
		it { should respond_to(:password) }
		it { should respond_to(:password_confirmation) }
		it { should respond_to(:password_digest) }
		it { should respond_to(:email) }
		it { should respond_to(:email_confirmation) }
		it { should respond_to(:dob) }
		it { should respond_to(:authenticate) }
		it { should be_valid }
	end

	# tests for username
	describe "when username is not present" do
		before { @user.username = " " }
		it { should_not be_valid }
	end

	describe "when username is too long" do
		before { @user.username = "a" * 16 }
		it { should_not be_valid }
	end

	describe "when username is illegal" do
		before do 
			@user.username = "*" * 10
			@user.username = "1" * 10
		end
		it { should_not be_valid }
	end

	describe "when username is already taken" do
	    before do
	      user_with_same_username = @user.dup
	      user_with_same_username.username = @user.username.upcase
	      user_with_same_username.save
	    end
	    it { should_not be_valid }
	end

	# tests for email
	describe "when email is not present" do
		before { @user.email = @user.email_confirmation = " " }
		it { should_not be_valid }
	end

	describe "when email doesn't match confirmation" do
  		before { @user.email_confirmation = "mismatch" }
  		it { should_not be_valid }
	end

	describe "when email confirmation is nil" do
  		before { @user.email_confirmation = nil }
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

	# tests for password
	describe "when password is not present" do
		before { @user.password = @user.password_confirmation = " " }
		it { should_not be_valid }
	end

	describe "when password is illegal" do
		before do 
			@user.password = "*" * 10
			@user.password = "1" * 10
			@user.password = "a" * 10
		end
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
  		before { @user.password_confirmation = "mismatch" }
  		it { should_not be_valid }
	end

	describe "when password confirmation is nil" do
  		before { @user.password_confirmation = nil }
  		it { should_not be_valid }
	end

	describe "with a password that's too short" do
    	before { @user.password = @user.password_confirmation = "a1a1a" }
    	it { should be_invalid }
  	end

  	describe "return value of authenticate method" do
    	before { @user.save }
    	let(:found_user) { User.find_by_email(@user.email) }

    	describe "with valid password" do
      		it { should == found_user.authenticate(@user.password) }
    	end

    	describe "with invalid password" do
      		let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      		it { should_not == user_for_invalid_password }
      		specify { user_for_invalid_password.should be_false }
    	end
  	end

  	# tests for date of birth
	describe "when date of birth is not present" do
		before { @user.dob = " " }
		it { should_not be_valid }
	end

	describe "when dob is invalid" do
		before do 
			@user.dob = "1894"
			@user.dob = "2001"
			@user.dob = "a" * 4
		end
		it { should_not be_valid }
	end
end