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

  validate :departure_at_cannot_be_in_the_past, on: :create
  validate :departure_at_cannot_be_in_the_past, on: :update, if: :departure_at_changed?

  def departure_at_cannot_be_in_the_past
    if departure_at.present? && departure_at < Time.now
      errors.add(:departure_at, :cannot_be_in_the_past)
    end
  end
end
