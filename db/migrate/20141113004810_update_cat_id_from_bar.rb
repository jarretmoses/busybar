class UpdateCatIdFromBar < ActiveRecord::Migration
  def change
    change_column :bars, :cat_id, :string
  end
end
