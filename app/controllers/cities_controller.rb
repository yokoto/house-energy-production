class CitiesController < ApplicationController
  def index
    cities = City.select(:id, :name)
    @cities_data = CityChartService.call(cities)
    @dates = Energy.dates
  end
end
