class CitiesController < ApplicationController
  def index
    @cities_data = City.eager_load(houses: :energies)
                       .map do |city|
                         {
                           name: city.name,
                           data: city.energies
                                     .select(:energies_production)
                                     .group(:year, :month)
                                     .order(:year, :month)
                                     .sum(:energy_production)
                         }
                       end
    @dates = Energy.distinct.pluck(:year, :month)
  end
end
