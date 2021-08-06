require 'rails_helper'

RSpec.describe 'Plots index page' do
  before :each do
    @garden_1 = Garden.create!(name: 'Turing Community Garden', organic: true)
    @plot_1 = @garden_1.plots.create!(number: 345, size: 'Medium', direction: 'North')
    @plant_1 = Plant.create(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    PlantPlot.create(plant: @plant_1, plot: @plot_1)
  end

  it 'displays a list of all plot numbers with their plants' do
    visit plots_path
    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plant_1.name)
  end

  it 'can delete plants from a plot' do
    visit plots_path

    within("#plots") do
      expect(page).to have_content("Remove Plant from Plot")
      click_link "Remove Plant from Plot"
    end

    expect(current_path).to eq(plots_path)
    expect(page).to_not have_content(@plant_1.name)
  end
end