class BookingsController < ApplicationController
  def index
    @bookings_pending = current_user.bookings.order(:status, :start_date).where(status: "pending")
    @bookings_accepted = current_user.bookings.order(:status, :start_date).where(status: "accepted")
    @bookings_refused = current_user.bookings.order(:status, :start_date).where(status: "refused")
  end

  def new
    @booking = Booking.new
    @island = Island.find(params[:island_id])
  end

   def create
    @booking = Booking.new(booking_params)
    @island = Island.find(params[:island_id])
    @booking.island = @island
    @booking.renter = current_user
    @booking.total_price = ((@booking.end_date - @booking.start_date).to_f) * @island.price_per_day
    @booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :nb_travelers)
  end
end
