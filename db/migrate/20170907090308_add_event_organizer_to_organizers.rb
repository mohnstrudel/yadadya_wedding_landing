class AddEventOrganizerToOrganizers < ActiveRecord::Migration[5.1]
  def change
    add_reference :organizers, :event_organizer, foreign_key: true
  end
end
