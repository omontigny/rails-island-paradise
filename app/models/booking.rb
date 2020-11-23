class Booking < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :island

  validates :start_date, presence: true
  validates :end_date, presence: true

  validates :nb_travelers, presence: true
  validates :total_price, presence: true
end
