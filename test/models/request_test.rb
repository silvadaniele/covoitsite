# == Schema Information
#
# Table name: requests
#
#  id                   :bigint(8)        not null, primary key
#  ride_id              :bigint(8)
#  user_id              :bigint(8)
#  number_of_passengers :integer
#  original_message     :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
