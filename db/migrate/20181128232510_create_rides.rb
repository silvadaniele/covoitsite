class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.string :origin
      t.string :destination
      t.datetime :departure_at
      t.integer :capacity
      t.decimal :price

      t.timestamps
    end
  end
end
