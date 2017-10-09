class CreateEventOrganizers < ActiveRecord::Migration[5.1]
  def change
    create_table :event_organizers do |t|
      t.belongs_to :event, foreign_key: true
      t.belongs_to :organizer, foreign_key: true

      t.timestamps
    end
  end
end
