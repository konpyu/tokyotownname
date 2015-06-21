class WardsController < ApplicationController
  def show
    @ward = Ward.find(params[:id])
  end
  def index
    @wards = Ward.all
  end
end
