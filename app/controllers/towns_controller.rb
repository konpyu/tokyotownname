class TownsController < ApplicationController
  def show
    @town = Town.find(params[:id])
  end
  def index
    @towns = Town.all
  end
end
