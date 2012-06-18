# == Schema Information
#
# Table name: events
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  startdate  :date
#  enddate    :date
#  status     :string(255)
#  summary    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Event do

	before do
		@event = Event.new(name: "Battle of Bunker Hill", status: "concluded",
			startdate: Date.new(1775, 6, 17), enddate: Date.new(1775, 6, 17), 
			summary: "The Battle of Bunker Hill took place on June 17, 1775, mostly on 
			and around Breed's Hill, during the Siege of Boston early in the American 
			Revolutionary War. The battle is named after the adjacent Bunker Hill, which 
			was peripherally involved in the battle and was the original objective of 
			both colonial and British troops, and is occasionally referred to as the 
			'Battle of Breed's Hill.'")
	end

	subject { @event }

	describe "fields should be populated" do
		it { should respond_to(:name) }
		it { should respond_to(:status) }
		it { should respond_to(:startdate) }
	end

	# tests for event name
	describe "when event already exists" do
	    before do
	      event_with_same_name = @event.dup
	      event_with_same_name.name = @event.name.upcase
	      event_with_same_name.save
	    end
	    it { should_not be_valid }
	end

	describe "when event name is not present" do
		before { @event.name = " " }
		it { should_not be_valid }
	end

	# tests for status
	describe "when event status is not present" do
		before { @event.status = " " }
		it { should_not be_valid }
	end

	# tests for start date
	describe "when event start date is not present" do
		before { @event.startdate = " " }
		it { should_not be_valid }
	end
end
