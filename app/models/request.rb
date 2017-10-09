class Request < ApplicationRecord

  belongs_to :event

  validates :first_name, :last_name, :company, :position, :phone, :facebook, :available_ticket_id, presence: true
  # validates :email, uniqueness: true
  validates_email_format_of :email, :message => 'Электронный адрес в неверном формате'

  # after_update :send_approval, :if => :approval_status_changed?
  
  scope :current, -> { where(event_id: Event.most_recent.id) }
  scope :pending, -> { where(approval_status: 'pending')}
  scope :approved, -> { where(approval_status: 'approved')}
  scope :today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }

  def send_approval
    RequestMailer.delay(queue: "user", priority: 5).user_approval(self)
  end

  def send_decline
    RequestMailer.delay(queue: "user", priority: 5).user_decline(self)
  end

  def approve
    self.approval_status = "approved"
    self.save!
    self.send_approval
  end

  def decline
    self.approval_status = "declined"
    self.save!
    self.send_decline
  end
end
