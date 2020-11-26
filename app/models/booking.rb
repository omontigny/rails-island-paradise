class Booking < ApplicationRecord

  # STATUS = %w[pending accepted refused]
  # associations
  belongs_to :renter, class_name: "User"
  belongs_to :island

  # Validations
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past

  validates :end_date, presence: true
  validate :end_date_cannot_be_less_than_start_date


  validates :nb_travelers, presence: true
  validates :total_price, presence: true
  # validates :status, inclusion: { in: STATUS }
  validates :status, presence: true

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_less_than_start_date
    if end_date < start_date
      errors.add(:end_date, "can't be after start date")
    end
  end
end
