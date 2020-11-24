class UpdateColumnSharkToIslands < ActiveRecord::Migration[6.0]
  def change
    change_column_default :islands, :shark, false
  end
end
