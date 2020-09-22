class HousesController < ApplicationController
  def index
    @houses = House.preload(:city).eager_load(:energies)
    @houses_data = @houses.select(:energy_production).group(:id).sum(:energy_production)
  end
end
