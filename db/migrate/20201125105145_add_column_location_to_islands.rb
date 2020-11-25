class AddColumnLocationToIslands < ActiveRecord::Migration[6.0]
  def change
    add_column :islands, :location, :string
  end
end
