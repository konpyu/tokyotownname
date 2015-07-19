class LivesController < ApplicationController
  def create
    livable = params[:livable_type].classify.constantize.find_by(id: params[:livable_id])
    live = Live.first_or_initialize(user: current_user, livable: livable, kind: params[:kind])
    if live.new_record?
      live.save!
      head :created
    else
      render json: { status: 'error' }
    end
  end
  def destroy
  end
end
