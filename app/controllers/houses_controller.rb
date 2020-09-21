class HousesController < ApplicationController
  def index
    @houses = House.preload(:city).eager_load(:energies)
  end
end
