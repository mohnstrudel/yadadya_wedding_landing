require 'rails_helper'

RSpec.describe Event, type: :model do
  let (:event) { FactoryGirl.build(:event) }

  context "valid event" do
    it "has title, subtitle and facebook" do
      expect{
        event.save
      }.to change(Event, :count).by(1)
    end
  end

  context "invalid event" do
    it "should be invalid with all params" do
      event.title = nil
      event.subtitle = nil
      event.facebook = nil
      event.sortable_date = nil

      expect(event).not_to be_valid
      expect{event.save}.not_to change(Event, :count)
    end

    it "is invalid without sortable_date" do
      event.sortable_date = nil
      expect(event).not_to be_valid
      expect{event.save}.not_to change(Event, :count)
    end

    it "is invalid without facebook" do
      event.facebook = nil
      expect(event).not_to be_valid
      expect{event.save}.not_to change(Event, :count)
    end

    it "is invalid without subtitle" do
      event.subtitle = nil
      expect(event).not_to be_valid
      expect{event.save}.not_to change(Event, :count)
    end

  end

  context "current event" do
    it "displays recent event by sortable date" do
      # Сохраняем первый ивент
      event.save
      # Сохраняем второй ивент. Он более актуальный по сути
      event_2 = FactoryGirl.create(:event, sortable_date: Time.zone.now - 1.hour)

      event.update(sortable_date: Time.zone.now)

      expect(Event.most_recent).to eq(event)
    end
  end
  
end
