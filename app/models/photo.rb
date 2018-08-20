class Photo < ApplicationRecord
  mount_uploader :image, PhotoUploader
  validates :image, presence: true
  belongs_to :post
end
