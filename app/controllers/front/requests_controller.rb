class Front::RequestsController < FrontController
  def create
    @request = Request.new(request_params)
    @request.event = Event.most_recent

    
    respond_to do |format|
      if @request.save
        format.js
        # RequestMailer.notify_user(@request).deliver_now
        # RequestMailer.notify_admin(@request).deliver_now
        RequestMailer.delay(queue: "user", priority: 5).notify_user(@request)
        RequestMailer.delay(queue: "admin", priority: 20).notify_admin(@request)
      else
        
        format.js { render partial: 'fail' }
        
      end
      
      # RequestMailer.delay(queue: "user", priority: 5).notify_user(@request)
      # RequestMailer.delay(queue: "admin", priority: 20).notify_admin(@request)

    end
  end

  private

  def request_params
    params.require(:request).permit(Request.attribute_names.map(&:to_sym))
  end
end
