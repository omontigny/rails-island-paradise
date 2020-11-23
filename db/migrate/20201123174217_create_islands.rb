class CreateIslands < ActiveRecord::Migration[6.0]
  def change
    create_table :islands do |t|
      t.string :name
      t.text :description
      t.integer :capacity
      t.string :ocean
      t.string :country
      t.references :user, null: false, foreign_key: true
      t.float :price_per_day
      t.boolean :shark

      t.timestamps
    end
  end
end
