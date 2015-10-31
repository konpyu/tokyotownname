class TownsController < ApplicationController
  def show
    @town = Town.find(params[:id])
    gon.town_id = @town.id
  end
  def index
    @towns = Town.all
  end
end
