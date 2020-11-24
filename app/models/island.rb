class Island < ApplicationRecord
  # associations
  belongs_to :owner, class_name: "User"
  has_many :bookings

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :capacity, presence: true, default: 1
  validates :ocean, presence: true
  validates :country, presence: true
  validates :price_per_day, presence: true
  validates :shark, presence: true, default: false
end
