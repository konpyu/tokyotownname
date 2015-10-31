class LivesController < ApplicationController
  def toggle_lives
    livable = params[:livable_type].classify.constantize.find_by(id: params[:livable_id])
    fail 'Error' if livable.blank?
    live = Live.first_or_initialize(user: current_user, livable: livable, kind: params[:kind])
    if live.new_record?
      live.save!
      head :created
    else
      live.destroy
      head :no_content
    end
  end
end
