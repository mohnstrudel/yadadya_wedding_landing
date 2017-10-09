class Organizer < ApplicationRecord
  mount_uploader :logo, PictureUploader
  mount_uploader :logo_grey, PictureUploader

  has_many :event_organizers, dependent: :destroy
  has_many :events, through: :event_organizers

  validates :title, :logo, :logo_grey, presence: true
end
