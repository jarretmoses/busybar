class UpdateVenueIdFromBar < ActiveRecord::Migration
  def change
    change_column :bars, :venue_id, :string
  end
end
