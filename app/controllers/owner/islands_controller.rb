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

  # def destroy
  #   @island = Island.find(params[:id])
  #   # @island = article.find(params[:id])
  #   @island.destroy

  #   # no need for app/views/restaurants/destroy.html.erb
  #   redirect_to owner_islands_path
  # end

  def island_params
    params.require(:island).permit(:country, :ocean, :location, :name, :picture, :price_per_day, :shark, :description, :picture)
  end
end
