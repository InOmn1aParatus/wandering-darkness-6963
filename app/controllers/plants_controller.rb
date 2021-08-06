class PlantsController < ApplicationController
  def destroy
    plant = Plant.find(params[:id])
    plot = Plot.find(params[:plot_id])
    plot.plants.destroy(plant)

    redirect_to plots_path
  end
end