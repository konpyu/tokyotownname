class TownsController < ApplicationController
  def show
  end
  def index
    @towns = Town.all
  end
end
