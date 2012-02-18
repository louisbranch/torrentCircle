module ApplicationHelper

  def format_rating(rating)
    case rating
      when 80..100 then c = 'great'
      when 60..79 then c = 'good'
      when 30..59 then c = 'ok'
      when 01..29 then c = 'terrible'
      when 0 then rating = '-'
    end
    content_tag(:td, rating, :class => "rating #{c}")
  end

end
