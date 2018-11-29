# == Schema Information
#
# Table name: rides
#
#  id           :bigint(8)        not null, primary key
#  owner_id     :integer
#  origin       :string
#  destination  :string
#  departure_at :datetime
#  capacity     :integer
#  price        :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class RideTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
