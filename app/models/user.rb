class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :bookings, foreign_key: :renter_id # as renter - current_user.bookings
  has_many :islands,  foreign_key: :owner_id # as owner - current_user.islands
  has_many :reservations, through: :islands, source: :bookings # as owner - rename bookings as reservations - current_user.reservations

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /.*@.*\.([a-z]{2}[a-z]?)/ }
  validates :password, confirmation: true,
                       length: {minimum: 8},
                       allow_blank: false
end
