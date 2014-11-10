class AddCatIdToBars < ActiveRecord::Migration
  def change
    add_column :bars, :cat_id, :integer
  end
end
