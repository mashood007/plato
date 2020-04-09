module CardsHelper

  def border_color card
    if card.tasks.blank?
      return "#0000FF"
    elsif card.tasks_completed?
      return "#3CFF33"
    else
      return "#FF3333" 
    end
  end

end
