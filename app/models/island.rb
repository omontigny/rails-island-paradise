class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings

  # has_many :users through bookings
  # alias_attribute :owner, :user
end
