# image quality
# https://github.com/carrierwaveuploader/carrierwave/wiki/How-to:-Specify-the-image-quality
module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|
  config.storage         = :fog
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['TTN_S3_ACCESS_KEY'],
    aws_secret_access_key: ENV['TTN_S3_ACCESS_SECRET'],
    region:                'ap-northeast-1',
  }
  config.fog_directory  = "ttn-photo"
  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000', 'Expires' => 10.years.from_now.httpdate }
  config.fog_authenticated_url_expiration = (365 * 24 * 60 * 60)
  config.remove_previously_stored_files_after_update = false
end
