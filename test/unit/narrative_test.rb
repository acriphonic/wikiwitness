require 'test_helper'
require 'Narrative'

class NarrativeTest < ActiveSupport::TestCase
	test "content must have more than 140 characters" do 
		narrative = Narrative.new("Lorem ipsum dolor sit amet")
		assert narrative.content.length > 140, "content too short"
 end


end
