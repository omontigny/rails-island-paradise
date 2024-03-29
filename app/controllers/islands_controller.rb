class IslandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    if params[:query].present?
      sql_query = "country ILIKE :query OR ocean ILIKE :query OR name ILIKE :query "
      @islands = Island.where(sql_query, query: "%#{params[:query]}%")
    else
      @islands = Island.geocoded.order(:name)
      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
      @markers = @islands.geocoded.map do |island|
        {
          lat: island.latitude,
          lng: island.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { island: island }),
          image_url: helpers.asset_url("map-marker.png")
      }
      end
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
        lng: @island.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { island: @island }),
        image_url: helpers.asset_url("map-marker.png")
    }
  end

  # def new
  #   @island = Island.new
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

  # def create
  #   @booking = Booking.new(booking_params)
  #   set_island
  #   @booking.island = @island
  #   @booking.save
  #   redirect_to bookings_path
  # end

  # def destroy
  #   @island = Island.find(params[:id])
  #   # @island = article.find(params[:id])
  #   @island.destroy

  #   # no need for app/views/restaurants/destroy.html.erb
  #   redirect_to islands_path
  # end

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
