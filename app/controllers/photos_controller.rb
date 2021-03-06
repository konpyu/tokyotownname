class PhotosController < ApplicationController
  before_action :authenticate!, only: [:upload, :create, :destroy]
  def index
    @photos = Photo.includes(:image, :ward, :town).order(id: :desc).page(params[:page]).per(10)
    @photos = @photos.where(user_id: params[:user_id]) if params[:user_id]
    @photos = @photos.where(town_id: params[:town_id]) if params[:town_id]
    @photos = @photos.where(ward_id: params[:ward_id]) if params[:ward_id]
    render json: { html: photo_item_html, page: @photos.current_page, is_last_page: @photos.last_page? } if request.xhr?
  end

  def upload
    image = Image.new
    image.image = params[:photo]
    image.user = current_user
    image.kind = 'photo'
    image.save!
    render json: { url: image.image_url, key: image.key, status: 'ok' }
  end

  def new
    gon.wards = {}
    @photos = Ward.all.includes(:towns)
    @photos.each do |ward|
      gon.wards[ward.id] = {}
      gon.wards[ward.id]['name'] = ward.name
      gon.wards[ward.id]['post_num'] = ward.post_num
      gon.wards[ward.id]['towns'] = []
      ward.towns.each do |town|
        gon.wards[ward.id]['towns'].push town
      end
    end
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
    @og_title = "#{@photo.ward.name}#{@photo.town.name} | TokyoTownName"
    @og_description = @photo.comment || '東京の風景を集めます'
    @og_image = @photo.image.image_url
    @og_url = photo_url(@photo)
  end

  def create
    fail 'Key is not specified' unless params[:key].present?

    ActiveRecord::Base.transaction do
      @photo = Photo.new(photo_params)
      @photo.ward = Town.find(params[:town_id]).ward
      @photo.user = current_user
      @photo.save!

      image = Image.find_by(key: params[:key])
      image.imageable = @photo
      image.save!
    end
    redirect_to photo_path(@photo)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy!
    redirect_to root_path
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
