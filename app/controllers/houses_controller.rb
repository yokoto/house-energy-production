class HousesController < ApplicationController
  def index
    @houses = House.preload(:city).eager_load(:energies)
    @cities = City.eager_load(houses: :energies)
    byebug
  end
end
