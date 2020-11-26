class Owner::BookingsController < ApplicationController
  # All my bookings
  def index
    @bookings = current_user.bookings
  end
end
