class Archive < ApplicationRecord
  belongs_to :event

  has_many :pictures, dependent: :destroy

  accepts_nested_attributes_for :pictures, :allow_destroy => true

  def self.find_proper
    return nil if Event.most_recent.nil?
    
    recent_event_id = Event.most_recent.id
    recent_event_offset = Event.order(sortable_date: :asc).offset(1).last
    if archive = find_by(event_id: recent_event_id)
      return archive
    elsif recent_event_offset.present?
      if archive = find_by(event_id: recent_event_offset.id)
        return archive
      end
    else
      return nil
    end
  end
end
