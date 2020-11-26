class Owner::IslandsController < ApplicationController
  # All my islands
  def index
    @islands = current_user.islands
  end

  def new

  end

  def create

  end

end
