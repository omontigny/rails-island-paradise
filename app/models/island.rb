class Island < ApplicationRecord
  # associations
  belongs_to :owner, class_name: "User"
  has_many :bookings

  # ActiveStorage
  has_one_attached :picture

  # Geocoder
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :capacity, presence: true
  validates :ocean, presence: true
  validates :country, presence: true
  validates :price_per_day, presence: true
  validates :location, presence: true
  validates_inclusion_of :shark, in: [true, false]
end
