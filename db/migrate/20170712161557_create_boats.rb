class CreateBoats < ActiveRecord::Migration[5.1]
  def change
    create_table :boats do |t|
      t.references :user, foreign_key: true
      t.references :port, foreign_key: true
      t.string :name
      t.integer :amount_of_containers

      t.timestamps
    end
  end
end

# < ======= user_id, port_id, name, amount_of_containers ======= >
