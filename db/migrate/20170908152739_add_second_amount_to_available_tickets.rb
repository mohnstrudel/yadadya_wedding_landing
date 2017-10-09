class AddSecondAmountToAvailableTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :available_tickets, :remaining_amount, :integer
  end
end
