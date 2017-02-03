class CitiesController < ApplicationController
  def index
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
  end

  private

  def city_params
    params.require(:city).permit(:name, :description)
  end

end
