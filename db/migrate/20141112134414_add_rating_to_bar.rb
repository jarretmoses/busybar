class AddRatingToBar < ActiveRecord::Migration
  def change
    add_column :bars, :rating, :float
  end
end
