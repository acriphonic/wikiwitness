# == Schema Information
#
# Table name: narratives
#
#  id         :integer         not null, primary key
#  event_id   :integer
#  user_id    :integer
#  name       :string(255)
#  location   :string(255)
#  content    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class NarrativeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
