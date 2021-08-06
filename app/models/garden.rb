class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots

  def plant_display
    self.plants
    .joins(:plant_plots)
    .select('plants.*, count(plant_plots.plant_id) as plot_count')
    .where('days_to_harvest < 100')
    .group('plants.id')
    .order('plot_count desc')
    .distinct
  end
end
