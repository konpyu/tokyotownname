class TopController < ApplicationController
  def index
    @photos = Photo.includes(:image, :ward, :town).all
  end
end
