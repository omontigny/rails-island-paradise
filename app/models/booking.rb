class Booking < ApplicationRecord

  # STATUS = %w[pending accepted refused]
  # associations
  belongs_to :renter, class_name: "User"
  belongs_to :island

  # Validations
  validates :start_date, presence: true
  validates :end_date, presence: true

  validates :nb_travelers, presence: true
  validates :total_price, presence: true
  # validates :status, inclusion: { in: STATUS }
  validates :status, presence: true
end
