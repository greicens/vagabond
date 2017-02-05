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
end
