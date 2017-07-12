class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true
      t.references :port_origin
      t.references :port_destination
      t.string :description
      t.integer :amount_of_containers
      t.integer :cost

      t.timestamps
    end
  end
end

# < ======= user_id, port_origin_id, port_destination_id, description, amount_of_containers, cost ======= >
