class CitiesController < ApplicationController
  def index
    @user = current_user || User.new
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.create(city_params)
    redirect_to cities_path
  end

  def show
    @city = City.friendly.find(params[:id])
    @user = User.new
  end

  private

  def city_params
    params.require(:city).permit(:name, :description)
  end

end
