class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :island, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :nb_travelers
      t.float :total_price
      t.string :status

      t.timestamps
    end
  end
end
