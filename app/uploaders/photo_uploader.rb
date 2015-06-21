class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if ['development', 'test'].include?(Rails.env)
    storage :file
  else
    # fix later
    storage :file
  end

  process :strip
  process :set_metadata
  process quality:  80

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def strip
    manipulate! do |img|
      img.strip
      img = yield(img) if block_given?
      img
    end
  end

  def set_metadata
    begin
      model.key = SecureRandom.hex(16)
    end while model.class.where(key: model.key).exists?
    model.ext           = @file.extension
    model.original_name = @file.filename

    image = MiniMagick::Image.open(current_path)
    model.width  = image[:width]
    model.height = image[:height]
    model.size   = image[:size]
  end

end
