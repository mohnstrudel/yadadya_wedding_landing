require 'rails_helper'

RSpec.feature "Requests feature spec >", :type => :feature do

  before(:each){
    @event = FactoryGirl.create(:event)
    @event.lectures.create(timeframe: "10:00 - 18:00")
    t_type = FactoryGirl.create(:ticket_type)
    @event.available_tickets.create(ticket_type: t_type, amount: 40, price: 400)
  }

  background do
    visit root_path
    within("#form") do
      fill_in 'request[last_name]', with: 'Doe'
      fill_in 'request[first_name]', with: 'Johnny'
      fill_in 'request[company]', with: 'Limited Corp.'
      fill_in 'request[position]', with: 'CEO'
      fill_in 'request[email]', with: 'johhny@limited.com'
      fill_in 'request[phone]', with: '+7 (903) 227-88-74'
      choose('ticket1')
    end
  end

  describe "the apply to event process", :type => :feature do

    it "rejects user with not all data provided" do
      # Facebook не заполнен      
      expect{
        click_button 'Отправить'
        }.not_to change(Request, :count)
    end

    it "approves user with all data provided" do
      within("#form") do
        fill_in 'request[facebook]', with: 'https://facebook.com/users/johnny_doe'
      end
      
      expect{
        click_button 'Отправить'
        }.to change(Request, :count).by(1)
    end

    it "confirms the right event id" do
      within("#form") do
        fill_in 'request[facebook]', with: 'https://facebook.com/users/johnny_doe'
      end
      click_button 'Отправить'

      request = Request.last

      expect(request[:event_id]).to eq(@event.id)
      expect(request[:event_id]).to eq(Event.most_recent.id)
    end
  end
end