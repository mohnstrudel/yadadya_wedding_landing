class CreateLectureSpeakers < ActiveRecord::Migration[5.1]
  def change
    create_table :lecture_speakers do |t|
      t.belongs_to :lecture, foreign_key: true
      t.belongs_to :speaker, foreign_key: true

      t.timestamps
    end
  end
end
