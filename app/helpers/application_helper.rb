module ApplicationHelper
  def ward_image(id)
    "/images/wards/#{id < 10 ? "10#{id}" : "1#{id}"}.png"
  end
end
