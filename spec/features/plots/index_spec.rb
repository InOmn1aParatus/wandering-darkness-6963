require 'rails_helper'

RSpec.describe 'Plots index page' do
  before :each do
    @garden_1 = Garden.create!(name: 'Turing Community Garden', organic: true)
    @plot_1 = @garden_1.plots.create!(number: 345, size: 'Medium', direction: 'North')
    @plot_2 = @garden_1.plots.create!(number: 346, size: 'Large', direction: 'East')
    @plant_1 = Plant.create(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_2 = Plant.create(name: "Angry Flower", description: "Oh, it's angry.", days_to_harvest: 91)
    PlantPlot.create(plant: @plant_1, plot: @plot_1)
    PlantPlot.create(plant: @plant_2, plot: @plot_2)
  end
  
  it 'displays a list of all plot numbers with their plants' do
    visit plots_path
    expect(page).to have_content(@plot_1.id)
    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plot_2.id)
    expect(page).to have_content(@plant_2.name)
  end
end