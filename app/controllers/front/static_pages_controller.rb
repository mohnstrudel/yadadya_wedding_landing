class Front::StaticPagesController < FrontController
  def home
    @event = Event.order(sortable_date: :asc).last
    @password = User.generate_password
    
    @speakers = @event.try(:speakers)
    @lectures = @event.try(:lectures)
    @organizers = @event.try(:organizers)
    @tickets = @event.try(:available_tickets)

    @start_time = @event.try(:start_time)
    @end_time = @event.try(:end_time)
    @archive = Archive.find_proper
  end
end
