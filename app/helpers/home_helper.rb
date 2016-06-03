module HomeHelper
  def render_stars(value)
    output = ''
    if (1..5).include?(value.floor)
      value.floor.times { output += image_tag('full-star.png')}
    end
    if (value + 0.5 >= value.floor + 1) && value.to_i != 5
      output += image_tag('half-star.png')
    end
    if (value < 0.5)
      5.times { output += image_tag('empty-star.png')}
    elsif (value < 4 && ![1,2,3,4,5].include?(value + 0.5))
      (5 - value).round.times { output += image_tag('empty-star.png') }
    elsif(value < 4.5)
      output += image_tag('empty-star.png')
    end
    output.html_safe
  end
end
