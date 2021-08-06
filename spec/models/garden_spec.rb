require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

  describe 'instance methods' do
    describe '::plant_display' do
      it 'displays plants with < 100 days to harvest in desc order of plot count' do
        garden = Garden.create(name: 'Turing Community Garden', organic: true)
        plot_1 = garden.plots.create(number: 345, size: 'Medium', direction: 'North')
        plot_2 = garden.plots.create(number: 346, size: 'Large', direction: 'East')
        plot_3 = garden.plots.create(number: 347, size: 'Small', direction: 'West')
        plant_1 = Plant.create(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
        plant_2 = Plant.create(name: "Angry Flower", description: "Oh, it's angry.", days_to_harvest: 91)
        plant_3 = Plant.create(name: "Cholocate Sapling", description: "Looks delicious; is not delicious.", days_to_harvest: 10)
        plant_plot_1 = PlantPlot.create(plant: plant_1, plot: plot_1)
        plant_plot_2 = PlantPlot.create(plant: plant_2, plot: plot_2)
        plant_plot_3 = PlantPlot.create(plant: plant_3, plot: plot_1)
        plant_plot_5 = PlantPlot.create(plant: plant_1, plot: plot_2)
        plant_plot_6 = PlantPlot.create(plant: plant_1, plot: plot_3)
        plant_plot_7 = PlantPlot.create(plant: plant_2, plot: plot_3)

        ordered = [plant_1, plant_2, plant_3]

        expect(garden.plant_display).to eq(ordered)
      end
    end
  end
end
