class PhotosController < ApplicationController
  def index
    @photos = Photo.includes(:image, :ward, :town).order(id: :desc).page(params[:page]).per(10)
    if request.xhr?
      render json: { html: photo_item_html, page: @photos.current_page, is_last_page: @photos.last_page? }
    end
  end

  def new
    gon.wards = {}
    Ward.all.each do |ward|
      gon.wards[ward.id] = {}
      gon.wards[ward.id]["name"] = ward.name
      gon.wards[ward.id]["post_num"] = ward.post_num
      gon.wards[ward.id]["towns"] = []
      ward.towns.each do |town|
        gon.wards[ward.id]["towns"].push town
      end
    end
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    # not gooo00d
    raise "Error" unless params[:photo].present?
    ActiveRecord::Base.transaction do
      @photo = Photo.new(photo_params)
      @photo.ward = Town.find(params[:town_id]).ward
      @photo.user = current_user
      @photo.save!

      image = Image.new
      image.user = current_user
      image.image = params[:photo]
      image.imageable = @photo
      image.kind = "photo"
      image.save!
    end
    redirect_to "/"
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy!
    redirect_to "/"
  end

  def update
  end

  private

  def photo_params
    params.permit(:town_id, :comment)
  end

  def photo_item_html
    render_to_string('top/_item', layout: false, formats: [:html])
  end
end
