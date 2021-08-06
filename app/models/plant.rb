class Plant < ApplicationRecord
  has_many :plant_plots
  has_many :plots, through: :plant_plots

  def gerden_display
    joins(:plots)
    .select("plants.*")
    .where("days_to_harvest < 100")
    .order()
  end
end
