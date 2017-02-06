module CitiesHelper
  #gets users rank_image
  def city_user_rank(user)
    if (user.points < 50)
      "scout.png"
    elsif (user.points.between?(50, 150))
      "explorer.png"
    elsif(user.points.between?(150, 300))
      "adventurer.png"
    else "trailblazer.png"
    end
  end

  def city_user_rank_title(user)
    if (user.points < 50)
      "Scout"
    elsif (user.points.between?(50, 150))
      "Explorer"
    elsif(user.points.between?(150, 300))
      "Adventurer"
    else "Trailblazer"
    end
  end
end
