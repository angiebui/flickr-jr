class Photo < ActiveRecord::Base
  belongs_to :album
  mount_uploader :filename, PhotoUploader
end
