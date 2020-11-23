class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :bookings
  has_many :islands, through: :bookings

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /.*@.*\.([a-z]{2}[a-z]?)/ }
  validates :password, :confirmation => true,
                       :length => {:within => 8..40},
                       :allow_blank => false
end
