class AddLectureSpeakerToLectures < ActiveRecord::Migration[5.1]
  def change
    add_reference :lectures, :lecture_speaker, foreign_key: true
  end
end
