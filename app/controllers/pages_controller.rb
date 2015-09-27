class PagesController < ApplicationController
  def about
  end

  def mypage
  end

  def search
    @wards = Ward.all
  end

  def achieve
    # num = {}
    # arrs = Photo.pluck(:ward_id, :town_id)
    # arrs.each do |arr|
    #   ward_id = arr[0]
    #   town_id = arr[1]
    #
    #   num[ward_id] ||= []
    #   num[ward_id] << town_id
    # end
    # num.keys.each do |key|
    #   num[key] = num[key].uniq.length
    # end
    @wards = Ward.all
  end
end
