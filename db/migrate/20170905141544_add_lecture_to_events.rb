class AddLectureToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :lecture, foreign_key: true
  end
end
