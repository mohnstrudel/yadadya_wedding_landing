module Front::MailHelper
  def get_titles(event)
    begin
      return "#{event.title}: #{event.subtitle}"
    rescue=>e
      p "Errors in get_title helper (helpers/front_helper.rb) encountered. Message: #{e.message}"
      return "Ошибка в названии мероприятия"
    end
  end
end