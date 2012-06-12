# == Schema Information
#
# Table name: narratives
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  location   :string(255)
#  content    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Narrative < ActiveRecord::Base
  attr_accessible :content, :location, :name
end
