class TopController < ApplicationController
  def index
    @photos = Photo.includes(:image, :ward, :town).order(id: :desc).limit(10)
  end
end
