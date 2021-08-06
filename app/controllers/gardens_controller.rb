class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @plants = @garden.plants
                .where("days_to_harvest < 100")
                .distinct
  end
end