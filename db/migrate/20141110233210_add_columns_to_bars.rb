class AddColumnsToBars < ActiveRecord::Migration
  def change
    add_column :bars, :venue_id, :integer
    add_column :bars, :url, :string
    add_column :bars, :here_now, :integer
  end
end
