require 'carrierwave/orm/activerecord'

class PhotoUploader < CarrierWave::Uploader::Base
  # include CarrierWave::RMagick 

  # storage :file

  # process :resize_to_fit => [320, 240]

  # version :thumb do
  #   process :resize_to_fill = => [150, 150]
  # end
end
