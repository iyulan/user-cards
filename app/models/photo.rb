class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  has_one :card
end
