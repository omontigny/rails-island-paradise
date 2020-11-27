class Owner::BookingsController < ApplicationController
  # All my bookings
  def index
    # island = Island.find(params[:id])
    ## select bookings where status == pending AND Island.owner_id = current_user
    @reservations_pending = current_user.reservations.where(status: "pending")

    # current_user.bookings.order(:status, :start_date).where(status: "pending").joins(:islands).where(owner: current_user)
    @reservations_accepted = current_user.reservations.where(status: "accepted")
    @reservations_refused = current_user.reservations.where(status: "refused")
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
