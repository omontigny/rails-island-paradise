class UpdateColumnCapacityToIslands < ActiveRecord::Migration[6.0]
  def change
    change_column_default :islands, :capacity, 1
  end
end
