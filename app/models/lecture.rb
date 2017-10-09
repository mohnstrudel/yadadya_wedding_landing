class Lecture < ApplicationRecord
  belongs_to :event

  has_many :lecture_speakers, dependent: :destroy
  has_many :speakers, through: :lecture_speakers

  accepts_nested_attributes_for :speakers, allow_destroy: true
end
