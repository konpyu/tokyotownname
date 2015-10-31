class TopController < ApplicationController
  def index
    @photos = Photo.includes(:image, :ward, :town, :user, :comments).order(id: :desc).page(params[:page]).per(10)

    gon.photos = {}
    @photos.each do |photo|
      gon.photos[photo.id.to_s] = photo.slice(:id, :user_id, :comment, :created_at)
      gon.photos[photo.id.to_s]['comments'] = photo.comments
      gon.photos[photo.id.to_s]['user'] = photo.user.slice(:id, :name)
      gon.photos[photo.id.to_s]['user']['image'] = photo.user.profile_image_url
      gon.photos[photo.id.to_s]['ward'] = photo.ward
      gon.photos[photo.id.to_s]['town'] = photo.town
      gon.photos[photo.id.to_s]['url'] =  photo.image.image.url
    end
  end
end
