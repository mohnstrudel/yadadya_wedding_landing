class AddApprovalToAvailableTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :available_tickets, :approval, :boolean
  end
end
