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

  def island_params
    params.require(:island).permit(:country, :ocean, :location, :name, :picture, :price_per_day, :shark, :description, :picture)
  end
end
