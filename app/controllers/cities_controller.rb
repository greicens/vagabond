class CitiesController < ApplicationController
  def index
    @user = current_user || User.new
    @cities = City.all
  end

  def new
     @city = City.new
     @user = current_user || User.new
     new_city_points
  end

  def create
    @city = City.create(city_params)
    redirect_to cities_path
  end

  def show
    @city = City.friendly.find(params[:id])
    @user = User.new
    @post = Post.new
  end

  private

  def city_params
    params.require(:city).permit(:name, :description)
  end

end
