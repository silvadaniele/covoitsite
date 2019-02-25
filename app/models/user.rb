# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  first_name             :string
#  last_name              :string
#  phone_number           :string
#  avatar                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  name                   :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :rides, foreign_key: :owner_id
  has_many :requests, dependent: :nullify

  validates :first_name, length: { minimum: 2 }, presence: true
  validates :last_name, length: { minimum: 2 }, presence: true
  validates :email, :phone_number, presence: true
  validate :phone_number_has_valid_format

  private

  def phone_number_has_valid_format
    return if Phonelib.valid_for_country?(self.phone_number, 'FR')
    return if Phonelib.valid_for_country?(self.phone_number, 'BR')

    self.errors.add(:phone_number, :invalid_format)
  end
end
