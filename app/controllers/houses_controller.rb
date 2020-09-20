class HousesController < ApplicationController
  def index
    @houses = House.preload(:city)
  end
end
