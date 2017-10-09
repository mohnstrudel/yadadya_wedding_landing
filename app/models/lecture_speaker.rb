class LectureSpeaker < ApplicationRecord
  belongs_to :lecture
  belongs_to :speaker
end
