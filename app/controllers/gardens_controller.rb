class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @plants = @garden.plant_display
  end
end