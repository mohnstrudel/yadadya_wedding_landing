class Front::RequestsController < FrontController
  def create
    @request = Request.new(request_params)
    @request.event = Event.most_recent
    @ticket = AvailableTicket.find(@request.available_ticket_id)

    if @ticket.approval == false && @ticket.price <= 0
      @request.approval_status = "approved"
      @request.payment_status = true
    elsif @ticket.approval == false && @ticket.price > 0
      @request.approval_status = "approved"
      @request.payment_status = false
    elsif @ticket.approval == true && @ticket.price <= 0
      @request.approval_status = "pending"
      @request.payment_status = true
    elsif @ticket.approval == true && @ticket.price > 0
      @request.approval_status = "pending"
      @request.payment_status = false
    end
    
    respond_to do |format|
      if @request.save
        # У выбранного билета уменьшаем кол-во доступных на 1 
        # метод в модели AvailableTicket
        ticket = AvailableTicket.find(params[:request][:available_ticket_id])
        ticket.buy_ticket

        # Сначала проверяем, может пользователь уже вообще залогинин
        # Если да, то присваиваем ему мероприятие через билет
        if current_user
          current_user.tickets.create(event_id: Event.most_recent.id)
        # Далее проверяем следующие кейсы - пользователь не залогинин, но есть в системе
        # и - пользователь совсем новый
        else
          # По номеру телефона _И_ по мейлу проверяем, есть ли такой пользователь в базе
          # (проверка идет в моделе User). Возвращает либо пользователя, либо nil
          user = User.check_if_exists(params[:request][:email], params[:request][:phone])
          if user
            # Если мы находим пользователя, то создаем на него билет (и тем самым)
            # связывая мероприятие и пользователя
            user.tickets.create(event_id: Event.most_recent.id)
          else
            # Если не находим, то регистрируем пользователя и также создаем на него билет
            generated_password = Devise.friendly_token.first(8)
            fresh_user =  User.create!(email: params[:request][:email], password: generated_password, first_name: params[:request][:first_name], last_name: params[:request][:last_name], company: params[:request][:company], position: params[:request][:position], phone: params[:request][:phone], facebook: params[:request][:facebook])
            fresh_user.tickets.create(event_id: Event.most_recent.id)
            # Заодно и сразу сайним ин пользователя, что бы форма при последующих
            # заходах автозаполнялась
            sign_in(:user, fresh_user)
          end
        end
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
