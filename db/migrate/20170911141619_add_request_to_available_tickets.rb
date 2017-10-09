class AddRequestToAvailableTickets < ActiveRecord::Migration[5.1]
  def change
    add_reference :available_tickets, :request, foreign_key: true
  end
end
