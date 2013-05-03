require 'carrierwave/orm/activerecord'
require 'carrierwave/processing/mini_magick'

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  process :resize_to_fill => [320, 240]

  version :thumb do
    process :resize_to_fill => [150, 150]
  end
end
