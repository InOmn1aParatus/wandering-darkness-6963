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
  # When I visit an garden's show page
  # Then I see a list of plants that are included in that garden's plots
  # And I see that this list is unique (no duplicate plants)
  # And I see that this list only includes plants
  # that take less than 100 days to harvest
end