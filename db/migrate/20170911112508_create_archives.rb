class CreateArchives < ActiveRecord::Migration[5.1]
  def change
    create_table :archives do |t|
      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end
