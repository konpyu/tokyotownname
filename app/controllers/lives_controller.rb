class LivesController < ApplicationController
  def create
    render json: { status: 'error'}
  end
  def destroy
  end
end
