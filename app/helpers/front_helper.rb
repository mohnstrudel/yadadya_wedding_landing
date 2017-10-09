module FrontHelper



  def get_organizer_class(organizer)
    css = organizer.logo_additional_css

    case css
    when "Вытянутый в ширину (слово, например)"
      return "g-organizers__img_wide"
    when "Вытянутый в высоту"
      return "g-organizers__img_tall"
    when "Симметричный"
      return "g-organizers__img_symmetrical"
    end
  end
end
