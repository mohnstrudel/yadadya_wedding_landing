class Front::EventsController < FrontController

  def show
    @event = Event.friendly.find(params[:id])

    @speakers = @event.speakers
    @lectures = @event.lectures
    @organizers = @event.organizers
    @tickets = @event.available_tickets

    @start_time = @event.lectures.first.timeframe.split(" - ")[0]
    @end_time = @event.lectures.last.timeframe.split(" - ")[1]
    @archive = @event.archive
  end
end
