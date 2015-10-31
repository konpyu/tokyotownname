class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    authentication = Authentication.where(uid: auth['uid'], provider: auth['provider']).first
    if authentication.present?
      session[:id] = User.find(authentication.user_id).try(:id)
      redirect_to :root and return
    else
      ActiveRecord::Base.transaction do
        user = User.create!(
          name: auth['info']['nickname'] || auth['info']['name']
        )
        Authentication.create!(
          user_id:  user.id,
          provider: auth['provider'],
          uid:      auth['uid'],
          name:     auth['info']['name'],
          nickname: auth['info']['nickname'],
          image:    auth['info']['image'],
          email:    auth['info']['email'],
          gender:   auth['info']['gender'],
          location: auth['info']['location']
        )
        session[:id] = user.id
      end
    end

    redirect_to '/'
  end

  def destroy
    session[:id] = nil
    redirect_to :root and return
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
