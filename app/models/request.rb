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

class Request < ApplicationRecord
  belongs_to :user
  belongs_to :ride

  validates :number_or_passengers, presence: true
  validates :number_of_passengers, numericality: { greater_than: 0, only_integer: true }
  validates :original_message, presence: true
  validates :original_message, length: { minimum: 10 }


end


class Ride < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  validates :origin, :destination, :departure_at, :capacity, :price, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validates :capacity, numericality: { greater_than_or_equal_to: 1, only_integer: true }

end
