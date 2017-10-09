class Speaker < ApplicationRecord
  mount_uploader :picture, PictureUploader

  validates :picture, :first_name, presence: true

  has_many :lecture_speakers, dependent: :destroy
  has_many :lectures, through: :lecture_speakers

  has_many :events, through: :lectures
end
