require 'rails_helper'

RSpec.describe 'Garden show page' do
  before :each do
    @garden = Garden.create(name: 'Turing Community Garden', organic: true)
    @plot_1 = @garden.plots.create(number: 345, size: 'Medium', direction: 'North')
    @plot_2 = @garden.plots.create(number: 346, size: 'Large', direction: 'East')
    @plant_1 = Plant.create(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_2 = Plant.create(name: "Angry Flower", description: "Oh, it's angry.", days_to_harvest: 91)
    @plant_3 = Plant.create(name: "Cholocate Sapling", description: "Looks delicious; is not delicious.", days_to_harvest: 100)
    @plant_4 = Plant.create(name: "Volcano Lily", description: "Why is there magma in this plant?", days_to_harvest: 100)
    @plant_plot_1 = PlantPlot.create(plant: @plant_1, plot: @plot_1)
    @plant_plot_2 = PlantPlot.create(plant: @plant_2, plot: @plot_2)
    @plant_plot_3 = PlantPlot.create(plant: @plant_3, plot: @plot_1)
    @plant_plot_4 = PlantPlot.create(plant: @plant_4, plot: @plot_2)
  end

  it 'displays list of plants from garden plots' do
    visit garden_path(@garden)

    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to_not have_content(@plant_3.name)
    expect(page).to_not have_content(@plant_4.name)
  end

  it 'lists plants in descending order of appearance in plots for this garden' do
    plot_3 = @garden.plots.create(number: 347, size: 'Small', direction: 'West')
    plant_plot_5 = PlantPlot.create(plant: @plant_1, plot: @plot_2)
    plant_plot_6 = PlantPlot.create(plant: @plant_1, plot: plot_3)
    plant_plot_7 = PlantPlot.create(plant: @plant_2, plot: plot_3)

    visit garden_path(@garden)
    within("#plants") do
      expect(@plant_1.name).to appear_before(@plant_2.name)
    end
  end
  # When I visit a garden's show page,
  # Then I see the list of plants is sorted by the number of plants
  #   that appear in any of that garden's plots from most to least
  # (Note: you should only make 1 database query
  #   to retrieve the sorted list of plants)
end