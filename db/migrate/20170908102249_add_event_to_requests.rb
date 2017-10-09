class AddEventToRequests < ActiveRecord::Migration[5.1]
  def change
    add_reference :requests, :event, foreign_key: true
  end
end
