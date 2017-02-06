module UsersHelper
  def post_points
    @user = current_user
    updated_points = @user.points + 5
    @user.update(points: updated_points)
  end

  def new_city_points
    @user = current_user
    updated_points = @user.points + 10
    @user.update(points: updated_points)
  end

  def rank
    if (@user.points < 50)
      "Scout"
    elsif (@user.points.between?(50, 150))
      "Explorer"
    elsif(@user.points.between?(150, 300))
      "Adventurer"
    else "Trail Blazer"
    end
  end

  def rank_image
    if (@user.points < 50)
      "scout.png"
    elsif (@user.points.between?(50, 150))
      "explorer.png"
    elsif(@user.points.between?(150, 300))
      "adventurer.png"
    else "trailblazer.png"
    end
  end

end
