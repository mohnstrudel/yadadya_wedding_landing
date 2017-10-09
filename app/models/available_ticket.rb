class AvailableTicket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :event

  

  after_create :set_remaining_amount

  def buy_ticket
    self.remaining_amount -= 1
    self.save!
  end

  private

  def set_remaining_amount
    self.remaining_amount = self.amount
    self.save!
  end

end
