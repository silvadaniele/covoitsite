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

  validates :origin, :destination, :departure_at, :capacity, :price, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validates :capacity, numericality: { greater_than_or_equal_to: 1, only_integer: true }

end
