# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Gardens

Garden.create(name: 'Turing Community Garden', organic: true)
Garden.create(name: 'Main Street Garden', organic: false)

# Plots

plot_1 = Garden.first.plots.create(number: 345, size: 'Medium', direction: 'North')
plot_2 = Garden.first.plots.create(number: 346, size: 'Large', direction: 'East')
plot_3 = Garden.last.plots.create(number: 878, size: 'Small', direction: 'East')
plot_4 = Garden.last.plots.create(number: 879, size: 'Small', direction: 'West')

# Plants

plant_1 = Plant.create(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
plant_2 = Plant.create(name: "Angry Flower", description: "Oh, it's angry.", days_to_harvest: 91)
plant_3 = Plant.create(name: "Cholocate Sapling", description: "Looks delicious; is not delicious.", days_to_harvest: 92)
plant_4 = Plant.create(name: "Volcano Lily", description: "Why is there magma in this plant?", days_to_harvest: 93)
plant_5 = Plant.create(name: "Butterfly Orchid", description: "Plants should not fly.", days_to_harvest: 94)
plant_6 = Plant.create(name: "Japanese Peace Lily", description: "More oxygen.", days_to_harvest: 95)

# PlantPlots

PlantPlot.create(plant: plant_1, plot: plot_1)
PlantPlot.create(plant: plant_2, plot: plot_2)
PlantPlot.create(plant: plant_3, plot: plot_3)
PlantPlot.create(plant: plant_4, plot: plot_4)