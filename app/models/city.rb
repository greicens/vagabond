class City < ApplicationRecord

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    
  end

  def show

  end

end
