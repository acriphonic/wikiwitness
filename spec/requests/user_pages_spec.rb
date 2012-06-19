require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "Example User"
        fill_in "Username", with: "exampleuser"
        fill_in "Email", with: "user@example.com"
        fill_in "E-mail Confirmation", with: "user@example.com"
        fill_in "Password", with: "Examp1epassword"
        fill_in "Password Confirmation", with: "Examp1epassword"
        fill_in "Date of Birth", with: 1985
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end