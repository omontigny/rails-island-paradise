class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @islands = Island.geocoded
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @islands.map do |island|
      {
        lat: island.latitude,
        lng: island.longitude
      }
    end
  end

  def show
    set_island
         @booking = Booking.new
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @marker = []
    @marker[0] =
    {
        lat: @island.latitude,
        lng: @island.longitude
    }
  end

  # def new
  #   @island = island.new
  # end

  # def create
  #   @island = Island.new(island_params)
  #   if @island.save
  #     redirect_to island_path(@island)
  #   else
  #     render 'new'
  #   end
  # end

  # New booking
  # def new
  #   set_island
  #   @booking = Booking.new
  # end

  def create
    @booking = Booking.new(booking_params)
    set_island
    @booking.island = @island
    @booking.save
    redirect_to bookings_path
  end


  private

  def island_params
    params.require(:island).permit(:name)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :nb_travelers)
  end

  def set_island
    @island = Island.find(params[:id])
  end
end
