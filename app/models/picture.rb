class Picture < ApplicationRecord
  belongs_to :archive

  mount_uploader :image, PictureUploader
end
