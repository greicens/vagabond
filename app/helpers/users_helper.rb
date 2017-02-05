module UsersHelper
  def post_points
    @user = current_user
    p "starting points are ", @user.points
    updated_points = @user.points + 5
    p "updated points variable is ", updated_points
    @user.update(points: updated_points)
    p "expected points ", @user.points
  end
end
