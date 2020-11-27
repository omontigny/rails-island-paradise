class Owner::IslandsController < ApplicationController
  # All my islands
  def index
    @islands = current_user.islands
    @island = Island.new
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.owner = current_user

    if @island.save
      redirect_to owner_islands_path(@island)
    else
      @islands = current_user.islands
      render "owner/islands/index"
    end
  end

  def update
    @island = Island.find(params[:id])
    @island.update(island_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    # no need for app/views/restaurants/create.html.erb
    redirect_to owner_islands_path
  end

  def destroy
    @islands = current_user.islands
    @island = Island.find(params[:id])
    if @island.bookings.empty?
      @island.destroy
      redirect_to owner_islands_path(@islands)
    else
      flash.alert = "You can't destroy this island is booked"
      render "owner/islands/index"
    end
    # no need for app/views/restaurants/destroy.html.erb
  end

  def island_params
    params.require(:island).permit(:country, :ocean, :location, :name, :picture, :price_per_day, :shark, :description, :picture)
  end
end
