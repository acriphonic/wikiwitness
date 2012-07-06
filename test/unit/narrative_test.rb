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

require 'test_helper'
require 'Narrative'

class NarrativeTest < ActiveSupport::TestCase
	test "content must have more than 140 characters" do 
		narrative = Narrative.new("Lorem ipsum dolor sit amet")
		assert narrative.content.length > 140, "content too short"
 end


end
