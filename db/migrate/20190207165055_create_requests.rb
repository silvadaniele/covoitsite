class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :ride, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :number_of_passengers
      t.text :original_message

      t.timestamps
    end
  end
end
