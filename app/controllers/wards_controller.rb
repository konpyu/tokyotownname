class WardsController < ApplicationController
  def show
    @ward = Ward.find(params[:id])
    gon.ward_id = @ward.id
  end

  def index
    @wards = Ward.all
  end
end
