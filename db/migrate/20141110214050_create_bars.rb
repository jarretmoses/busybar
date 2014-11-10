class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.integer :checkinsCount
      t.integer :usersCount

      t.timestamps null: false
    end
  end
end
