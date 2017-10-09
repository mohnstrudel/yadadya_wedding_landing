class CreateAvailableTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :available_tickets do |t|
      t.belongs_to :ticket_type, foreign_key: true
      t.belongs_to :event, foreign_key: true
      t.integer :amount
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
