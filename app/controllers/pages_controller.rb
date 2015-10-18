class PagesController < ApplicationController
  def about
  end

  def mypage
  end

  def search
    @wards = Ward.all.includes(:towns)
  end

  def achieve
    @wards = Ward.all
    gon.archive = {}
    @wards.each do |ward|
      gon.archive[ward.id] ||= {}
      gon.archive[ward.id][:value] = Photo.where(ward_id: ward.id).count # NOTE: has bug
      gon.archive[ward.id][:max]   = Town.where(ward_id: ward.id).count
    end
  end
end
