require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { FactoryGirl.create(:user) }

  context "signing in for event" do
    it "has the correct id" do
      recent_but_old_event = FactoryGirl.create(:event)
      new_but_not_recent_event = FactoryGirl.create(:event, sortable_date: Time.zone.now - 1.hour)

      recent_but_old_event.update(sortable_date: Time.zone.now)

      user.tickets.create(event_id: Event.most_recent.id)

      expect(user.tickets.last.event_id).to eq(recent_but_old_event.id)

    end
  end

  
end
