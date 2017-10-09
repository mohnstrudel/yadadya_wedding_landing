class AddEventOrganizerToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :event_organizer, foreign_key: true
  end
end
