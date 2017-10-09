class AddLectureSpeakerToSpeakers < ActiveRecord::Migration[5.1]
  def change
    add_reference :speakers, :lecture_speaker, foreign_key: true
  end
end
