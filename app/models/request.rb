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

  validates :number_of_passengers, presence: true
  validates :number_of_passengers, numericality: { greater_than: 0, only_integer: true }
  validates :original_message, presence: true
  validates :original_message, length: { minimum: 10 }
  validate :user_not_equal_to_ride_owner

  private

  def user_not_equal_to_ride_owner
    if self.user_id == self.ride.owner_id
      self.errors.add(:user_id, "Can not be the same than the ride owner.")
    end
  end
end



