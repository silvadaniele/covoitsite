class CreateTesters < ActiveRecord::Migration[5.2]
  def change
    create_table :testers do |t|

      t.timestamps
    end
  end
end
