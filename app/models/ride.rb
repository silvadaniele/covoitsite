# == Schema Information
#
# Table name: rides
#
#  id           :bigint(8)        not null, primary key
#  owner_id     :bigint(8)
#  origin       :string
#  destination  :string
#  departure_at :datetime
#  capacity     :integer
#  price        :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Ride < ApplicationRecord
  belongs_to :owner, class_name: 'User'
end
