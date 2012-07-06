
# == Schema Information
#
# Table name: narratives
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  location   :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer
#  event_id   :integer
#  content    :text
#

require 'spec_helper'

describe Narrative do
	before do
		@narrative = Narrative.new(name: "The Forgotten Samurai", location: "Karakura, Japan", 
		content:"After a frenzied dance of crimson and steel to the wailing of fading souls 
	  	the 9 year war was finally ended. But it was not with extraordinary strength nor with
  		superior skill that General Yamamoto won the battle against his famed foe.....") 
	end

	subject { @narrative }

	describe "fields should be populated" do
		it { should respond_to(:name) }
		it { should respond_to(:content) }
		it { should be_valid }
	end

	# tests for narrative post title
	describe "when name is not present" do
		before { @narrative.name = " " }
		it { should_not be_valid }
    end

    describe "with a name that is too long" do
		before { @narrative.name = "a" * 101 }
		it { should_not be_valid }
    end
    
    # tests for narrative content
    describe "when content is not present" do
		before { @narrative.content = " " }
		it { should_not be_valid }
    end

    describe "with a content that is too short" do
		before { @narrative.name = "a" * 139}
		it { should_not be_valid }
    end
end

