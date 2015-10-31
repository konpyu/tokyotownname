class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_og

  def set_og
    @og_title = 'TokyoTownName'
    @og_url = root_url
    @og_image = "#{root_url}images/about/townimage.jpg"
    @og_description = "東京の風景を集めます"
  end

  class Tokyotownname::BadRequest < StandardError; end    # 400
  class Tokyotownname::UnAuthorized < StandardError; end  # 401
  class Tokyotownname::Forbidden < StandardError; end     # 403
  class Tokyotownname::NotFound < StandardError; end      # 404
  class Tokyotownname::NotAllowed < StandardError; end    # 405
  class Tokyotownname::UnprocessableEntity < StandardError; end    # 422

  rescue_from ActiveRecord::RecordNotFound do
    render 'errors/not_found', layout: 'errors', status: 404
  end

  rescue_from Tokyotownname::BadRequest do
    render 'errors/bad_request', layout: 'errors', status: 400
  end

  rescue_from Tokyotownname::UnAuthorized do
    render 'errors/unauthorized', layout: 'errors', status: 401
  end

  rescue_from Tokyotownname::Forbidden do
    render 'errors/forbidden', layout: 'errors', status: 403
  end

  rescue_from Tokyotownname::NotAllowed do
    render 'errors/not_allowed', layout: 'errors', status: 405
  end

  rescue_from Tokyotownname::UnprocessableEntity do
    render 'errors/unprocessable_entity', layout: 'errors', status: 422
  end

  def bad_request!
    raise Tokyotownname::BadRequest.new
  end

  def unauthorized!
    raise Tokyotownname::UnAuthorized.new
  end

  def forbidden!
    raise Tokyotownname::Forbidden.new
  end

  def not_found!
    raise Tokyotownname::NotFound.new
  end

  def not_allowed!
    raise Tokyotownname::NotAllowed.new
  end

  def unprocessable_entity!
    raise Tokyotownname::UnprocessableEntity.new
  end

  def required_attributes!(keys)
    keys.each do |key|
      bad_request!(key) unless params[key].present?
    end
  end

  def authenticate!
    raise Tokyotownname::UnAuthorized if current_user.blank?
  end

  def current_user
    return User.find_by(id: session[:id])
  end
  helper_method :current_user

end
