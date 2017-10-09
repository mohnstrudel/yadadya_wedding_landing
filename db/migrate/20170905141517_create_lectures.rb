class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.string :timeframe
      t.string :title
      t.belongs_to :event, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
