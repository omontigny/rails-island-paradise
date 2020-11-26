class Owner::BookingsController < ApplicationController
  # All my bookings
  def index
    @bookings_pending = current_user.bookings.order(:status, :start_date).where(status: "pending")
    @bookings_accepted = current_user.bookings.order(:status, :start_date).where(status: "accepted")
    @bookings_refused = current_user.bookings.order(:status, :start_date).where(status: "refused")
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: "accepted")
    redirect_to owner_bookings_path
  end

  def refuse
    @booking = Booking.find(params[:id])
    @booking.update(status: "refused")
    redirect_to owner_bookings_path
  end
end
